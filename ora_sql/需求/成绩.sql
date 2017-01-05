truncate table xijiaweb.undergraduate_course_results;
insert into xijiaweb.undergraduate_course_results
  (sno, establish_time, establish_flag, course_code,course_name, credit_points, result)
  select t1.xh   sno,
         t1.xn   establish_time,
         t1.xqdm establish_flag,
         t1.kcdm course_code,
         t2.kcmc course_name,
         t1.xf   credit_points,
         t1.zpcj result
    from xj_gl.t_d_bzks_kscj t1,xj_gl.t_d_bzks_kc t2,xj_gl.t_d_bzks t3
   where t1.kcdm=t2.kcdm(+)
   and t1.xh=t3.xh
   and t1.partid = '03'
   and t2.partid='03'
   and t3.partid='03';
   commit;
