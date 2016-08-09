create or replace procedure p_demo4(in_acct_day in varchar2,
                                    v_retcode   out varchar2,
                                    v_retinfo   out varchar2) is
  ----------------------过程信息----begin-----------------------------------
  --功能描述：插入目标表的源表信息
  --编写人  ：王刚
  --创建时间：2015 年6 月25 日
  --目标表  ：t_proc_relation
  --执行周期：手动                                    
  v_proc_num number(32); --执行记录id
  v_rowcount number(16); --dml 行数

begin

  select aueic.seq_t_log.nextval into v_proc_num from dual;
  insert into aueic.t_log
    (id, log_day, proc_name, start_time, flag)
  values
    (v_proc_num, in_acct_day, 'aueic.p_demo4', sysdate, 'running');
  commit;

  insert into wg_temp
    select in_acct_day acct_day, 'p_demo4' insert_text from dual;
  v_rowcount := sql%rowcount;
  commit;

  v_retcode := 'success';
  --更新记录
  update aueic.t_log t
     set t.end_time  = sysdate,
         t.flag      = 'finish',
         t.row_count = v_rowcount,
         t.exec_time = sysdate - t.start_time,
         t.ret_code  = v_retcode
   where id = v_proc_num;
  commit;

exception
  when others then
    v_retcode := 'fail';
    v_retinfo := to_char(sqlerrm) || ',' ||
                 dbms_utility.format_error_backtrace;
    dbms_output.put_line(v_retinfo);
  
    update aueic.t_log t
       set t.end_time  = sysdate,
           t.flag      = 'break',
           t.exec_time = sysdate - t.start_time,
           t.ret_code  = v_retcode,
           t.ret_info  = v_retinfo
     where id = v_proc_num;
    commit;
end;
