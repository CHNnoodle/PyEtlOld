--truncate table xijiaweb.undergraduate_courses;
insert into xijiaweb.undergraduate_courses
  (course_code,
   course_type,
   course_name,
   course_description,
   credit_points,
   credit_hours,
   theory_class_hour,
   experiment_class_hour,
   class_no,
   school_year,
   school_term,
   select_number)
  select t1.kcdm   course_code,
         kclbdm    course_type,
         kcmc      course_name,
         kcjj      course_description,
         t1.xf     credit_points,
         t1.xs     credit_hours,
         llxs      theory_class_hour,
         syxs      experiment_class_hour,
         t2.jxbh   class_no,
         t2.kkxn   school_year,
         t2.kkxqdm school_term,
         t2.kxh    select_number
    from xj_jwgl.t_d_bzks_kc t1, xj_jwgl.t_d_bzks_kk t2
   where t1.kcdm = t2.kcdm
     and t1.partid = '22'
     and t2.partid = '22';
