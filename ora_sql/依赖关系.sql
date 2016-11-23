declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_insert_proc_relation('xijia.p_aam_ky_hjcg', --目标过程
                                       'xj_gl.p_t_d_ky_cghj', --依赖过程
                                       '',
                                       '王刚',
                                       v_a,
                                       v_b);
end;
