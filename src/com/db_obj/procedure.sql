create or replace procedure p_demo4(in_acct_day in varchar2,
                                    v_retcode   out varchar2,
                                    v_retinfo   out varchar2) is
  ----------------------������Ϣ----begin-----------------------------------
  --��������������Ŀ����Դ����Ϣ
  --��д��  ������
  --����ʱ�䣺2015 ��6 ��25 ��
  --Ŀ���  ��t_proc_relation
  --ִ�����ڣ��ֶ�                                    
  v_proc_num number(32); --ִ�м�¼id
  v_rowcount number(16); --dml ����

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
  --���¼�¼
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
