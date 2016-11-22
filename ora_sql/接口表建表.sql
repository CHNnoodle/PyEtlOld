declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_create_table('xj_gl.T_d_KY_ZZ',
                                       'STAGE.T_KY_ZZ',
                                       v_a,
                                       v_b);
end;
