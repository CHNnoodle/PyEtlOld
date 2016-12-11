truncate table xijiaweb.card_accounts;
insert into xijiaweb.card_accounts
  (card_account,
   card_no,
   sno,
   identity_category,
   regist_date,
   validity_date)
  select kh     card_account,
         kxlh   card_no,
         sfrzh  sno,
         kpztdm identity_category,
         zcrq   regist_date,
         kyxq   validity_date
    from xj_gl.t_d_ykt_kh
    where partid='10';
    commit;
