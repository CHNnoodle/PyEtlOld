select * from STAGE.T_BZKS_QGZXBCFF;

insert into xijiaweb.student_subsidy
  (sno,
   school_year,
   term_dm,
   supporting_sponsor,
   subsidy_reason,
   subsidy_sum)
  select t1.xh   sno,
         t1.xn   school_year,
         t1.xq   term_dm,
         t1.dwdm supporting_sponsor,
         sqly    subsidy_reason,
         t2.sfje subsidy_sum
    from stage.t_bzks_qgzx t1, stage.t_bzks_qgzxbcff t2
   where t1.xh = t2.xh
     and t1.qggwid = t2.qggwid
