--truncate table xijiaweb.card_merchants;
insert into xijiaweb.card_merchants
  (merchant_code, merchant_name, card_kinds)
  select shdm merchant_code, shmc merchant_name, shfldm
    from xj_gl.t_d_ykt_sh
    where partid='10';
commit;

insert into xijiaweb.card_merchant_shops
  (SHOP_CODE, SHOP_NAME, SHOP_TYPE)
  select shdm merchant_code, shmc merchant_name, shfldm
    from xj_gl.t_d_ykt_sh
    where partid='10';
commit;


insert into xijiaweb.campus_merchants
  (merchant_code, merchant_name, merchant_type)
  select shdm merchant_code, shmc merchant_name, shfldm
    from xj_gl.t_d_ykt_sh
    where partid='10';
commit;
