truncate table xijiaweb.card_transactions;
insert into xijiaweb.card_transactions
  (card_account,
   card_account_num,
   record_date,
   transaction_date,
   transaction_time,
   transaction_type,
   transaction_id,
   merchant_code,
   sub_merchant_code,
   transaction_amount,
   transaction_balance,
   total_transaction_number)
  select kh card_account,
         kh card_account_num,
         jyrq record_date,
         jyrq transaction_date,
         to_date(jyrq || ' ' || jysj, 'yyyy-mm-dd hh24:mi:ss') transaction_time,
         t2.dm transaction_type,
         jylsh transaction_id,
         shdm merchant_code,
         shdm sub_merchant_code,
         jyje transaction_amount,
         jyye transaction_balance,
         kjs total_transaction_number
    from cwgl.t_d_ykt_grjy t1, xj_code.code_ykt_jylx t2
   where jyyf in ('201610', '201611')
     and t1.jylx = t2.mc;
select * from xijiaweb.card_transactions
