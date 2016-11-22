declare
  acct_day varchar2(20) := '20160401';
  v_a      varchar2(20);
  v_b      varchar2(20);

begin
  while acct_day <= '20161103' loop
    cwgl.p_t_d_ykt_grjy(acct_day, v_a, v_b);
    cwgl.p_t_d_bzks(acct_day, v_a, v_b);
    cwgl.p_t_d_ykt_sh(acct_day, v_a, v_b);
    cwgl.p_t_d_ykt_kh(acct_day, v_a, v_b);
    cwgl.p_dmn_xs(acct_day, v_a, v_b);
    cwgl.p_adm_ykt_xsxf(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_xfqk_zdgf(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_zdqk(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_xfqk_xs(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_xsccxfqk(acct_day, v_a, v_b);
    cwgl.p_t_d_lastaction(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_cz(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_xssfxfqk(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_xfqk_ssmz(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_xfqk_ssmz_bwc(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_ysslxsxx(acct_day, v_a, v_b);
    cwgl.p_aam_ykt_ysslxssj(acct_day, v_a, v_b);
  
    acct_day := to_char(to_date(acct_day, 'yyyymmdd') + 1, 'yyyymmdd');
  end loop;
end;
