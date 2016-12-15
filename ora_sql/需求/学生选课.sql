truncate table xijiaweb.student_courses;
insert into xijiaweb.student_courses
  (sno,
   class_no,
   course_category,
   created_at,
   course_code,
   course_type,
   establish_time,
   course_semester)
  select xh sno,
         t1.jxbh class_no,
         kclbdm course_category,
         to_date(xkrq, 'yyyy-mm-dd') created_at,
         t2.kcdm course_code,
         t2.kcsxdm course_type,
         t2.kkxn establish_time,
         t2.kkxqdm course_semester
    from xj_gl.t_d_bzks_xk t1, xj_gl.t_d_bzks_kk t2
   where t1.jxbh = t2.jxbh
   and t1.partid='10'
   and t2.partid='10'
   and t2.kkxn='2015-2016';
    commit;

truncate table xijiaweb.student_courses;
insert into xijiaweb.student_courses
  (sno,
   class_no,
   course_category,
   created_at,
   course_code)
  select t1.xh sno,
         t1.jxbh class_no,
         kclbdm course_category,
         to_date(xkrq, 'yyyy-mm-dd') created_at,
         substr(t1.jxbh,1,length(t1.jxbh)-1) course_code
    from xj_gl.t_d_bzks_xk t1,xj_ryxx.t_d_xsxx t2
   where  t1.xh=t2.xh
     and t1.partid='14'
     and t2.partid='14'
     and t2.sfzx=1;
    commit;
