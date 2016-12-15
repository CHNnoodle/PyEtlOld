insert into xijiaweb.undergraduate_course_results
  (sno, establish_time, establish_flag, course_code, credit_points, result)
  select xh   sno,
         xn   establish_time,
         xqdm establish_flag,
         kcdm course_code,
         xf   credit_points,
         zpcj result
    from xj_gl.t_d_bzks_kscj
   where partid = '14';
   commit;
