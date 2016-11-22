declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_insert_proc_relation('xj_gl.p_t_d_ky_zz',
                                       '',
                                       '4:00',
                                       'Íõ¸Õ',
                                       v_a,
                                       v_b);
end;
