insert into xijiaweb.student_grants
  (sno,
   school_year,
   school_term,
   grant_name,
   grant_lvl,
   grant_type,
   grant_je,
   subsidize_dw,
   subsidize_time)

  select xh      sno,
         xn      school_year,
         xqdm    school_term,
         jxjmc   grant_name,
         jxjdjdm grant_lvl,
         jxjlxdm grant_type,
         jxje    grant_je,
         bjdw    subsidize_dw,
         ffrq    subsidize_time
  
    from stage.t_bzks_jxj
