truncate table xijiaweb.student_courses;
insert into xijiaweb.student_courses
  (sno, class_no, course_type, created_at)
  select xh sno, jxbh class_no, kclbdm course_type, to_date(xkrq,'yyyy-mm-dd') created_at
    from xj_gl.t_d_bzks_xk;
commit;
