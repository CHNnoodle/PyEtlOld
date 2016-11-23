insert into xijiaweb.card_merchants
  (merchant_code, merchant_name, created_at)
  select shdm merchant_code, shmc merchant_name, clrq created_at
    from stage.t_ykt_sh
