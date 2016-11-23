truncate table xijiaweb.student_work_for_study;
insert into xijiaweb.student_work_for_study
  (sno,
   grant_date,
   department,
   station,
   pay,
   school_date,
   term,
   work_address,
   work_dates)
 select t1.xh sno,
       t2.ffrq grant_date,
       t1.dwdm department,
       t1.qggwid station,
       t2.sfje pay,
       t1.xn school_date,
       t1.xq term,
       t1.by1 work_address,
       case
         when t1.qyrq <= 12 then
          case
            when t1.qyrq between 2 and 8 then
             substr(t1.xn, 1, 4) || '-' || qyrq
            else
             substr(t1.xn, 1, 4) || '-' || qyrq
          end
         else
          null
       end work_dates
  from stage.t_bzks_qgzx t1, stage.t_bzks_qgzxbcff t2
 where t1.xh = t2.xh
   and t1.qyrq = t2.ffrq;
commit;
