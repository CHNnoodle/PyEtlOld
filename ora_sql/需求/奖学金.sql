/*insert into xijiaweb.student_grants
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
  
    from stage.t_bzks_jxj;
*/
insert into xijiaweb.student_scholarship
  (sno,
   school_year,
   school_term_code,
   scholarship_name,
   scholarship_lv,
   schoolarship_dm,
   schoolarship_sum)
  select xh      sno,
         xn      school_year,
         xqdm    school_term_code,
         jxjmc   scholarship_name,
         jxjdjdm scholarship_lv,
         jxjlxdm schoolarship_dm,
         jxje    schoolarship_sum
    from stage.t_bzks_jxj
