truncate table xijiaweb.student_work_for_study;
insert into xijiaweb.student_work_for_study
  (sno,
   grant_date,
   department,
   station,
   pay,
   school_date,
   term,
   work_dates,
   work_type,
   work_aim,
   work_address)
  select t1.xh sno,
         t2.ffrq grant_date,
         t3.ygdw department,
         t1.qggwid station,
         t2.sfje pay,
         t1.xn school_date,
         t1.xq term,
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
         end work_dates,
         t3.gwlxdm work_type,
         t3.gwyq work_aim,
         t3.gzdd work_address
    from xj_gl.t_d_bzks_qgzx t1,
         xj_gl.t_d_bzks_qgzxbcff t2,
         (select *
            from xj_gl.t_d_bzks_qgzxgw
           where partid = '10'
             and rw = 1) t3
   where t1.wid = t2.wid
     and t1.partid = '10'
     and t2.partid = '10'
     and t1.wwid = t3.wid(+);
 commit;
