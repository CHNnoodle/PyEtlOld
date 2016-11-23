declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_create_table('xj_gl.t_d_ykt_kh',
                                       'stage.t_ykt_kh',
                                       v_a,
                                       v_b);
end;
