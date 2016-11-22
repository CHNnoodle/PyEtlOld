declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_create_table('xj_gl.t_d_ky_xm_ry',
                                       'stage.t_ky_xm_ry',
                                       v_a,
                                       v_b);
end;
