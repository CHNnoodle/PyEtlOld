select * from stage.t_bzks_kc;
insert into xijiaweb.undergraduate_courses
  (COURSE_CODE,
   COURSE_TYPE,
   COURSE_NAME,
   COURSE_DESCRIPTION,
   CREDIT_POINTS,
   CREDIT_HOURS,
   THEORY_CLASS_HOUR,
   EXPERIMENT_CLASS_HOUR)
  select kcdm   COURSE_CODE,
         kclbdm COURSE_TYPE,
         kcmc   COURSE_NAME,
         KCJJ   COURSE_DESCRIPTION,
         xf     CREDIT_POINTS,
         xs     CREDIT_HOURS,
         llxs   THEORY_CLASS_HOUR,
         syxs   EXPERIMENT_CLASS_HOUR
    from xj_jwgl.t_d_bzks_kc;

select * from xijiaweb.undergraduate_courses
