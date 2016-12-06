--truncate table xijiaweb.card_merchants;
insert into xijiaweb.card_merchants
  (merchant_code, merchant_name, created_at, card_kinds)
  select shdm merchant_code, shmc merchant_name, shfldm
    from xj_gl.t_d_ykt_sh
