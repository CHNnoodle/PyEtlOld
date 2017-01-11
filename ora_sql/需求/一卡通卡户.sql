truncate table xijiaweb.card_accounts;
insert into xijiaweb.card_accounts
  (card_account,
   card_no,
   sno,
   identity_category,
   regist_date,
   validity_date,
   person_type,
   sub_person_type )
  select kh card_account,
         kxlh card_no,
         sfrzh sno,
         kpztdm identity_category,
         zcrq regist_date,
         kyxq validity_date,
         case
           when t.khfl in (1, 2) then
            1
           when t.khfl = 3 then
            2
           else
            9
         end person_type,
         t.khfl sub_person_type
    from xj_gl.t_d_ykt_kh t
   where partid = '04';
    commit;
