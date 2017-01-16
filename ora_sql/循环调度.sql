declare
  acct_day varchar2(20) := '20170110';
  v_a      varchar2(20);
  v_b      varchar2(20);

begin
  while acct_day <= '20170110' loop
    ykt_biee.p_aam_sy_year_a(acct_day, v_a, v_b);
    ykt_biee.p_aam_sy_year_xs_a(acct_day, v_a, v_b);
    ykt_biee.p_aam_sy_year_xs_b(acct_day, v_a, v_b);
    ykt_biee.p_aam_sy_year_xs_c(acct_day, v_a, v_b);
    ykt_biee.p_aam_sy_year_xs_d(acct_day, v_a, v_b);
    ykt_biee.p_aam_sy_month_xs_a(acct_day, v_a, v_b);
    ykt_biee.p_aam_sy_month_xs_b(acct_day, v_a, v_b);
    acct_day := to_char(to_date(acct_day, 'yyyymmdd') + 1, 'yyyymmdd');
  end loop;
end;
