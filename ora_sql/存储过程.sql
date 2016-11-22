create or replace procedure xj_gl.p_t_d_ky_xm_ry(in_acct_day in varchar2,
                                                 v_retcode   out varchar2,
                                                 v_retinfo   out varchar2) is
  ----------------------过程信息 ----begin-----------------------------------
  --功能描述：本专科生课程信息
  --编写人  ：王刚
  --创建时间：2016 年11 月11 日
  --过程名称：xj_gl.p_t_d_ky_xm_ry
  --依赖过程：
  --目标表  ：xj_gl.t_d_ky_xm_ry
  --数据源表：stage.t_ky_xm_ry
  --执行周期：每日
  v_proc_num number(32); --执行记录id
  v_rowcount number(16); --dml 行数

begin

  select xijia.seq_t_log.nextval into v_proc_num from dual;
  insert into xijia.t_log
    (id, log_day, proc_name, start_time, flag)
  values
    (v_proc_num, in_acct_day, 'xj_gl.p_t_d_ky_xm_ry', sysdate, 'running');
  commit;

  execute immediate 'alter table xj_gl.t_d_ky_xm_ry truncate partition part' ||
                    substr(in_acct_day, -2);

  insert into xj_gl.t_d_ky_xm_ry
    select in_acct_day jlrq,
           substr(in_acct_day, -2) partid,
           wid,
           xmid,
           rybh,
           xm,
           pm,
           clrq,
           czlx,
           sysdate opt_time,
           null source_flag
      from stage.t_ky_xm_ry;

  v_rowcount := sql%rowcount;
  commit;

  v_retcode := 'success';
  --更新记录
  update xijia.t_log t
     set t.end_time  = sysdate,
         t.flag      = 'finish',
         t.row_count = v_rowcount,
         t.exec_time =
         (sysdate - t.start_time) * 24 * 60 * 60,
         t.ret_code  = v_retcode
   where id = v_proc_num;
  commit;

exception
  when others then
    v_retcode := 'fail';
    v_retinfo := to_char(sqlerrm) || ',' ||
                 dbms_utility.format_error_backtrace;
    dbms_output.put_line(v_retinfo);
  
    update xijia.t_log t
       set t.end_time  = sysdate,
           t.flag      = 'break',
           t.exec_time = sysdate - t.start_time,
           t.ret_code  = v_retcode,
           t.ret_info  = v_retinfo
     where id = v_proc_num;
    commit;
end;
