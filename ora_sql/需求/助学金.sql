--stage.t_bzks_zxj
truncate table xijiaweb.student_grants;
insert into xijiaweb.student_grants
  (sno,
   school_year,
   school_term,
   grant_name,
   grant_lvl,
   grant_type,
   grant_je,
   subsidize_time,
   subsidize_dw)
  select xh    sno,
         xn    school_year,
         xqdm  school_term,
         zxjmc grant_name,
         zxjdj grant_lvl,
         zxjlx grant_type,
         zxje  grant_je,
         sfrq  subsidize_time,
         dwdm  subsidize_dw
    from stage.t_bzks_zxj;
    commit;
