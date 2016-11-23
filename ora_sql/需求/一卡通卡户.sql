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
    from stage.t_ykt_kh
