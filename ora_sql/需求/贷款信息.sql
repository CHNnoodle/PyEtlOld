insert into xijiaweb.student_loans
  (sno,
   bank,
   total_sum,
   loan_begintime,
   loan_endtime,
   loan_reason)
  select xh      sno,
         jbyhhdw bank,
         zje     total_sum,
         jkksrq  loan_begintime,
         jkjsrq  loan_endtime,
         sqly    loan_reason
    from stage.t_bzks_dk;

stage.t_bzks_dk stage.t_bzks_dkff
