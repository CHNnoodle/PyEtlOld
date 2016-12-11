
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
   total_transaction_number,
   sno)
  select t1.kh card_account,
         t1.kh card_account_num,
         jyrq record_date,
         jyrq transaction_date,
         to_date(jyrq || ' ' || jysj, 'yyyy-mm-dd hh24:mi:ss') transaction_time,
         t2.dm transaction_type,
         jylsh transaction_id,
         shdm merchant_code,
         shdm sub_merchant_code,
         jyje transaction_amount,
         jyye transaction_balance,
         kjs total_transaction_number,
         t3.sfrzh sno
    from xj_gl.t_d_ykt_grjy t1, xj_code.code_ykt_jylx t2,xj_gl.t_d_ykt_kh t3
   where t1.jylx = t2.mc
     and t1.kh=t3.kh
     and t3.partid='04';
