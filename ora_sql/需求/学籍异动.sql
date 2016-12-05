select * from xijiaweb.school_roll_changes;
insert into xijiaweb.school_roll_changes
  (sno,
   change_time,
   change_type,
   change_reason,
   origin_department_code,
   origin_major_name,
   origin_grade,
   origin_class,
   origin_system,
   now_department_code,
   now_major_code,
   now_grade,
   now_class,
   now_system)
  select xh     sno,
         ydrq   change_time,
         ydlbdm change_type,
         ydyydm change_reason,
         ydwdm  origin_department_code,
         yzydm  origin_major_name,
         ynj    origin_grade,
         ybh    origin_class,
         yxz    origin_system,
         xyxdm  now_department_code,
         xzydm  now_major_code,
         xnj    now_grade,
         xbh    now_class,
         xxz    now_system
    from xj_gl.t_d_bzks_xjyd
   where partid = '01'
