select xijia.pkg_etl_model.f_object_valid(r.target_proc) target_proc
  from xijia.t_proc_relation r, xijia.t_log t
 where r.target_proc = t.proc_name(+)
   and r.source_number = 0
   and r.target_type = 2
   and r.status = 1
   and to_date('20170402' || ' ' || r.ready_time, 'yyyymmdd hh24:mi') >
       sysdate
   and t.log_day(+) = '20170402'
   and (id is null or flag is null)
 group by r.target_proc
