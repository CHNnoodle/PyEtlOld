create or replace package pkg_etl_model is

  type date_table is table of date index by binary_integer;
  type number_table is table of number index by binary_integer;
  type varchar2_table is table of varchar2(50) index by binary_integer;

  function f_object_exist(in_object_name    varchar2,
                          in_partition_name varchar2 default null)
    return number;

  function f_object_valid(in_object_name varchar2) return varchar2;

  procedure p_insert_proc_relation(in_target_proc varchar2,
                                   in_source_proc varchar2,
                                   in_ready_time  varchar2,
                                   in_optname     varchar2,
                                   v_retcode      out varchar2,
                                   v_retinfo      out varchar2);

  procedure p_judge_run(in_acct_day varchar2,
                        out_procs   out varchar2_table,
                        out_done    out number,
                        out_all     out number,
                        out_valid   out number,
                        v_retcode   out varchar2,
                        v_retinfo   out varchar2);

  procedure p_create_table(create_table_name varchar2,
                           refer_table_name  varchar2,
                           v_retcode         out varchar2,
                           v_retinfo         out varchar2);

  procedure p_create_his_table(refer_table_name varchar2,
                               v_retcode        out varchar2,
                               v_retinfo        out varchar2);

end pkg_etl_model;
/
create or replace package body pkg_etl_model is

  /*
    判断 object 是否存在
  */
  function f_object_exist(in_object_name    varchar2,
                          in_partition_name varchar2 default null)
    return number as
    v_num number;
  begin
    if in_partition_name is null then
      select count(*)
        into v_num
        from all_objects
       where owner || '.' || object_name = upper(in_object_name);
    else
      select count(*)
        into v_num
        from all_objects
       where owner || '.' || object_name = upper(in_object_name)
         and subobject_name = upper(in_partition_name);
    end if;
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
                                   in_ready_time  varchar2,
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
  
    select distinct source_proc
      bulk collect
      into arr_proc
      from (select regexp_substr(source_proc || ',', '[^,]+', 1, rownum) source_proc
              from (select lower(in_source_proc) source_proc from dual)
            connect by level <= 10)
     where source_proc is not null;
  
    v_source_number := arr_proc.count;
  
    if v_source_number = 0 then
      delete from xijia.t_proc_relation t
       where target_proc = lower(in_target_proc);
      insert into xijia.t_proc_relation
        (target_proc, source_number, ready_time, opt_name, addtime, status)
      values
        (lower(in_target_proc),
         v_source_number,
         nvl(in_ready_time, '6:00'),
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
    
      delete from xijia.t_proc_relation t
       where target_proc = lower(in_target_proc);
      insert into xijia.t_proc_relation
        (target_proc,
         source_proc,
         source_number,
         ready_time,
         opt_name,
         addtime,
         status)
        select distinct lower(in_target_proc),
                        source_proc,
                        v_source_number,
                        nvl(in_ready_time, '6:00'),
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
    dbms_output.put_line('success');
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

  procedure p_judge_run(in_acct_day varchar2,
                        out_procs   out varchar2_table,
                        out_done    out number,
                        out_all     out number,
                        out_valid   out number,
                        v_retcode   out varchar2, --输出变量
                        v_retinfo   out varchar2) is
    ----------------------过程信息----begin-----------------------------------
    --功能描述：判断过程是否可以执行
    --编写人  ：王刚
    --创建时间：2015 年6 月25 日
    --目标表  ：
    --执行周期：python 自动调度
  
    v_odiflag number;
  
  begin
    select count(distinct r.target_proc)
      into out_done
      from xijia.t_proc_relation r, xijia.t_log t
     where r.target_proc = t.proc_name
       and r.status = 1
       and t.log_day = in_acct_day
       and ret_code = 'success';
  
    select count(distinct target_proc),
           count(distinct f_object_valid(target_proc))
      into out_all, out_valid
      from xijia.t_proc_relation t
     where status = 1;
  
    select count(*)
      into v_odiflag
      from t_log t
     where proc_name = 'stage.odi_njust'
       and log_day >= in_acct_day;
  
    if v_odiflag >= 1 then
      --判断无数据源依赖的过程
      select distinct target_proc
        bulk collect
        into out_procs
        from (select f_object_valid(r.target_proc) target_proc
                from xijia.t_proc_relation r, xijia.t_log t
               where r.target_proc = t.proc_name(+)
                 and r.source_number = 0
                 and r.status = 1
                 and to_date(to_char(to_date(in_acct_day, 'yyyymmdd') + 1,
                                     'yyyymmdd') || ' ' || r.ready_time,
                             'yyyymmdd hh24:mi') <= sysdate
                 and t.log_day(+) = in_acct_day
                 and (id is null or flag is null)
               group by r.target_proc
              union all
              --有数据源依赖的过程
              select f_object_valid(target_proc) target_proc
                from (select r.target_proc,
                             max(source_number) max_number,
                             count(distinct t2.proc_name) count_number
                        from xijia.t_proc_relation r,
                             xijia.t_log           t1,
                             xijia.t_log           t2
                       where r.target_proc = t1.proc_name(+)
                         and r.source_number > 0
                         and r.status = 1
                         and to_date(to_char(to_date(in_acct_day, 'yyyymmdd') + 1,
                                             'yyyymmdd') || ' ' ||
                                     r.ready_time,
                                     'yyyymmdd hh24:mi') <= sysdate
                         and r.source_proc = t2.proc_name(+)
                         and t1.log_day(+) = in_acct_day
                         and (t1.id is null or t1.flag is null)
                         and t2.log_day(+) = in_acct_day
                         and t2.ret_code = 'success'
                       group by r.target_proc)
               where max_number = count_number)
       where target_proc is not null
         and rownum <= 10; --控制并发数量
    
      for i in 1 .. out_procs.count loop
        dbms_output.put_line(out_procs(i));
        update xijia.t_log
           set flag = 'rerun'
         where log_day = in_acct_day
           and proc_name = out_procs(i)
           and flag is null;
        commit;
      end loop;
    
    end if;
    v_retcode := 'success';
    dbms_output.put_line('success');
  exception
    when others then
      v_retcode := 'fail';
      v_retinfo := to_char(sqlerrm) || ',' ||
                   dbms_utility.format_error_backtrace;
      dbms_output.put_line(v_retinfo);
  end p_judge_run;

  procedure p_create_table(create_table_name varchar2,
                           refer_table_name  varchar2,
                           v_retcode         out varchar2, --输出变量
                           v_retinfo         out varchar2) is
    ----------------------过程信息----begin-----------------------------------
    --功能描述：根据接口表来创建表
    --编写人  ：王刚
    --创建时间：2015 年6 月25 日
    --目标表  ：
    --执行周期：手动调度
  
    v_sql long;
    target_exist    exception;
    refer_not_exist exception;
  begin
    if f_object_exist(create_table_name) >= 1 then
      raise target_exist;
    end if;
  
    if f_object_exist(refer_table_name) = 0 then
      raise refer_not_exist;
    end if;
  
    v_sql := 'create table ' || create_table_name ||
             ' (jlrq char(8),partid char(2),wid varchar2(500),';
    for j in (select t1.column_id,
                     case
                       when t1.column_name in
                            ('JLRQ',
                             'PARTID',
                             'WID',
                             'OPT_TIME',
                             'SOURCE_FLAG') then
                        t1.column_name || '2'
                       else
                        t1.column_name
                     end || ' ' || t1.data_type || case
                       when t1.data_type = 'DATE' then
                        null
                       when t1.data_type = 'NUMBER' and
                            data_precision is not null then
                        '(' || t1.data_precision || ',' ||
                        nvl(t1.data_scale, 0) || ')'
                       else
                        '(' || t1.data_length || ')'
                     end || ',' create_table_column
                from all_tab_cols t1, all_tables t2
               where t1.owner = t2.owner
                 and t1.table_name = t2.table_name
                 and t1.owner || '.' || t1.table_name =
                     upper(refer_table_name)
                 and (t1.num_nulls != t2.num_rows or t1.num_nulls is null)
                 and t1.column_name != 'WID'
               order by t1.column_id) loop
      v_sql := v_sql || j.create_table_column;
    end loop;
    v_sql := v_sql || 'opt_time date,source_flag varchar2(10))
partition by list(partid)
(partition part01 values(''01''), partition part02 values(''02''),
 partition part03 values(''03''), partition part04 values(''04''),
 partition part05 values(''05''), partition part06 values(''06''),
 partition part07 values(''07''), partition part08 values(''08''),
 partition part09 values(''09''), partition part10 values(''10''),
 partition part11 values(''11''), partition part12 values(''12''),
 partition part13 values(''13''), partition part14 values(''14''),
 partition part15 values(''15''), partition part16 values(''16''),
 partition part17 values(''17''), partition part18 values(''18''),
 partition part19 values(''19''), partition part20 values(''20''),
 partition part21 values(''21''), partition part22 values(''22''),
 partition part23 values(''23''), partition part24 values(''24''),
 partition part25 values(''25''), partition part26 values(''26''),
 partition part27 values(''27''), partition part28 values(''28''),
 partition part29 values(''29''), partition part30 values(''30''),
 partition part31 values(''31''))';
  
    dbms_output.put_line(v_sql);
    execute immediate v_sql;
    for x in (select 'comment on column ' || t2.owner || '.' ||
                     t2.table_name || '.' || t2.column_name || ' is ''' ||
                     t1.comments || '''' create_col_comment
                from all_col_comments t1, all_col_comments t2
               where t1.column_name = t2.column_name
                 and t1.owner || '.' || t1.table_name =
                     upper(refer_table_name)
                 and t2.owner || '.' || t2.table_name =
                     upper(create_table_name)) loop
      dbms_output.put_line(x.create_col_comment);
      execute immediate x.create_col_comment;
    end loop;
  
    v_retcode := 'success';
    dbms_output.put_line('success');
  exception
    when target_exist then
      v_retcode := 'fail';
      v_retinfo := 'target table is exist';
      dbms_output.put_line(v_retinfo);
    when refer_not_exist then
      v_retcode := 'fail';
      v_retinfo := 'refer table is not exist';
      dbms_output.put_line(v_retinfo);
    when others then
      v_retcode := 'fail';
      v_retinfo := to_char(sqlerrm) || ',' ||
                   dbms_utility.format_error_backtrace;
      dbms_output.put_line(v_retinfo);
  end p_create_table;

  procedure p_create_his_table(refer_table_name varchar2,
                               v_retcode        out varchar2, --输出变量
                               v_retinfo        out varchar2) is
    ----------------------过程信息----begin-----------------------------------
    --功能描述：根据接口表来历史拍照表
    --编写人  ：王刚
    --创建时间：2015 年6 月25 日
    --目标表  ：
    --执行周期：手动调度
  
    create_table_name varchar2(50);
    table_name        varchar2(50) := substr(refer_table_name,
                                             instr(refer_table_name, '.') + 1,
                                             length(refer_table_name));
    v_sql             long;
    target_exist    exception;
    refer_not_exist exception;
  begin
    if f_object_exist(refer_table_name) = 0 then
      raise refer_not_exist;
    end if;
  
    create_table_name := 'xj_his.' || table_name;
    if f_object_exist(create_table_name) >= 1 then
      raise target_exist;
    end if;
  
    v_sql := 'create table ' || create_table_name ||
             ' as select ''20161231'' jlrq,t.* from ' || refer_table_name || ' t
             where 1=2';
    dbms_output.put_line(v_sql);
    execute immediate v_sql;
    v_sql := 'create or replace procedure xj_his.p_' || table_name ||
             '(in_acct_day in varchar2,
                                                  v_retcode   out varchar2,
                                                  v_retinfo   out varchar2) is
  ----------------------过程信息 ----begin-----------------------------------
  --功能描述：
  --编写人  ：王刚
  --创建时间：2017 年1 月1 日
  --过程名称：
  --依赖过程：
  --目标表  ：
  --数据源表：
  --执行周期：每日
  v_proc_num number(32); --执行记录id
  v_rowcount number(16); --dml 行数

begin

  select xijia.seq_t_log.nextval into v_proc_num from dual;
  insert into xijia.t_log
    (id, log_day, proc_name, start_time, flag)
  values
    (v_proc_num, in_acct_day, ''xj_his.p_' || table_name ||
             ''', sysdate, ''running'');
  commit;

  delete from xj_his.' || table_name || ' where jlrq = in_acct_day;
  insert into xj_his.' || table_name || '
    select in_acct_day jlrq, t.* from stage.' || table_name || ' t;

  v_rowcount := sql%rowcount;
  commit;

  v_retcode := ''success'';
  update xijia.t_log t
     set t.end_time  = sysdate,
         t.flag      = ''finish'',
         t.row_count = v_rowcount,
         t.exec_time =
         (sysdate - t.start_time) * 24 * 60 * 60,
         t.ret_code  = v_retcode
   where id = v_proc_num;
  commit;
  dbms_output.put_line(v_retcode);

exception
  when others then
    v_retcode := ''fail'';
    v_retinfo := to_char(sqlerrm) || '','' ||
                 dbms_utility.format_error_backtrace;
    dbms_output.put_line(v_retinfo);
  
    update xijia.t_log t
       set t.end_time  = sysdate,
           t.flag      = ''break'',
           t.exec_time = sysdate - t.start_time,
           t.ret_code  = v_retcode,
           t.ret_info  = v_retinfo
     where id = v_proc_num;
    commit;
end;';
    execute immediate v_sql;
  
    v_retcode := 'success';
    dbms_output.put_line('success');
  exception
    when target_exist then
      v_retcode := 'fail';
      v_retinfo := 'target table is exist';
      dbms_output.put_line(v_retinfo);
    when refer_not_exist then
      v_retcode := 'fail';
      v_retinfo := 'refer table is not exist';
      dbms_output.put_line(v_retinfo);
    when others then
      v_retcode := 'fail';
      v_retinfo := to_char(sqlerrm) || ',' ||
                   dbms_utility.format_error_backtrace;
      dbms_output.put_line(v_retinfo);
  end p_create_his_table;

end pkg_etl_model;
/
