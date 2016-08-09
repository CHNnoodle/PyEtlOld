create or replace package pkg_etl_model is

  type date_table is table of date index by binary_integer;
  type number_table is table of number index by binary_integer;
  type varchar2_table is table of varchar2(50) index by binary_integer;

  function f_object_exist(in_object_name varchar2) return number;

  function f_object_valid(in_object_name varchar2) return varchar2;

  procedure p_insert_proc_relation(in_target_proc varchar2,
                                   in_source_proc varchar2,
                                   in_optname     varchar2,
                                   v_retcode      out varchar2,
                                   v_retinfo      out varchar2);

  procedure p_judge_run(out_procs out varchar2_table,
                        out_done  out number,
                        out_all   out number,
                        v_retcode out varchar2,
                        v_retinfo out varchar2);

end pkg_etl_model;


create or replace package body pkg_etl_model is

  /*
    判断 object 是否存在
  */
  function f_object_exist(in_object_name varchar2) return number as
    v_num number;
  begin
    select count(*)
      into v_num
      from all_objects
     where owner || '.' || object_name = upper(in_object_name);
    return v_num;
  end f_object_exist;

  /*
    判断 object 是否有效
  */
  function f_object_valid(in_object_name varchar2) return varchar2 as
    v_num           number;
    out_object_name varchar2(50);
  begin
    select count(*)
      into v_num
      from all_objects
     where owner || '.' || object_name = upper(in_object_name)
       and status = 'VALID';
    if v_num > 0 then
      out_object_name := in_object_name;
    end if;
    return out_object_name;
  end f_object_valid;

  procedure p_insert_proc_relation(in_target_proc varchar2,
                                   in_source_proc varchar2,
                                   in_optname     varchar2,
                                   v_retcode      out varchar2, --输出变量
                                   v_retinfo      out varchar2) is
    ----------------------过程信息----begin-----------------------------------
    --功能描述：插入目标表的源表信息
    --编写人  ：王刚
    --创建时间：2015 年6 月25 日
    --目标表  ：t_proc_relation
    --执行周期：手动
  
    v_source_number number(10);
    arr_proc        varchar2_table;
    target_not_exist exception;
    source_not_exist exception;
  
  begin
    if f_object_exist(in_target_proc) < 1 then
      raise target_not_exist;
    end if;
  
    select distinct source_proc bulk collect
      into arr_proc
      from (select regexp_substr(source_proc || ',', '[^,]+', 1, rownum) source_proc
              from (select lower(in_source_proc) source_proc from dual)
            connect by level <= 10)
     where source_proc is not null;
  
    v_source_number := arr_proc.count;
  
    if v_source_number = 0 then
      delete from t_proc_relation t
       where target_proc = lower(in_target_proc);
      insert into t_proc_relation
        (target_proc, source_number, opt_name, addtime, status)
      values
        (lower(in_target_proc),
         v_source_number,
         lower(in_optname),
         sysdate,
         1);
      commit;
    
    else
    
      for i in 1 .. arr_proc.count loop
        if f_object_exist(arr_proc(i)) < 1 then
          raise source_not_exist;
        end if;
      end loop;
    
      delete from t_proc_relation t
       where target_proc = lower(in_target_proc);
      insert into t_proc_relation
        (target_proc,
         source_proc,
         source_number,
         opt_name,
         addtime,
         status)
        select distinct lower(in_target_proc),
                        source_proc,
                        v_source_number,
                        lower(in_optname),
                        sysdate,
                        1 status
          from (select regexp_substr(source_proc || ',', '[^,]+', 1, rownum) source_proc
                  from (select lower(in_source_proc) source_proc from dual)
                connect by level <= 10)
         where source_proc is not null;
      commit;
    end if;
  
    v_retcode := 'finish';
  
    --异常抛出
  exception
    when target_not_exist then
      v_retcode := 'fail';
      v_retinfo := 'target proc is not exist';
      dbms_output.put_line(v_retinfo);
    when source_not_exist then
      v_retcode := 'fail';
      v_retinfo := 'source proc is not exist';
      dbms_output.put_line(v_retinfo);
    when others then
      v_retcode := 'fail';
      v_retinfo := to_char(sqlerrm) || ',' ||
                   dbms_utility.format_error_backtrace;
      dbms_output.put_line(v_retinfo);
  end p_insert_proc_relation;

  procedure p_judge_run(out_procs out varchar2_table,
                        out_done  out number,
                        out_all   out number,
                        v_retcode out varchar2, --输出变量
                        v_retinfo out varchar2) is
    ----------------------过程信息----begin-----------------------------------
    --功能描述：判断过程是否可以执行
    --编写人  ：王刚
    --创建时间：2015 年6 月25 日
    --目标表  ：
    --执行周期：python 自动调度  
  
  begin
    select count(distinct r.target_proc)
      into out_done
      from t_proc_relation r, t_log t
     where r.target_proc = t.proc_name
       and r.status = 1
       and t.log_day = to_char(sysdate - 1, 'yyyymmdd')
       and ret_code = 'success';
  
    select count(distinct target_proc)
      into out_all
      from t_proc_relation t
     where status = 1;
  
    --判断无数据源依赖的过程
    select distinct target_proc bulk collect
      into out_procs
      from (select f_object_valid(r.target_proc) target_proc
              from t_proc_relation r, t_log t
             where r.target_proc = t.proc_name(+)
               and r.source_number = 0
               and r.status = 1
               and t.log_day(+) = to_char(sysdate - 1, 'yyyymmdd')
               and id is null
             group by r.target_proc
            union all
            --有数据源依赖的过程            
            select f_object_valid(target_proc) target_proc
              from (select r.target_proc,
                           max(source_number) max_number,
                           count(distinct t2.proc_name) count_number
                      from t_proc_relation r, t_log t1, t_log t2
                     where r.target_proc = t1.proc_name(+)
                       and r.source_number > 0
                       and r.status = 1
                       and r.source_proc = t2.proc_name(+)
                       and t1.log_day(+) = to_char(sysdate - 1, 'yyyymmdd')
                       and t1.id is null
                       and t2.log_day(+) = to_char(sysdate - 1, 'yyyymmdd')
                       and t2.ret_code = 'success'
                     group by r.target_proc)
             where max_number = count_number)
     where target_proc is not null;
  
    for i in 1 .. out_procs.count loop
      dbms_output.put_line(out_procs(i));
    end loop;
    v_retcode := 'success';
  exception
    when others then
      v_retcode := 'fail';
      v_retinfo := to_char(sqlerrm) || ',' ||
                   dbms_utility.format_error_backtrace;
      dbms_output.put_line(v_retinfo);
  end p_judge_run;

end pkg_etl_model;
