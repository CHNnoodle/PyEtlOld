declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_insert_proc_relation('xj_gl.p_t_d_bzks_qgzxbcff', --目标过程
                                       '', --依赖过程
                                       '',
                                       '王刚',
                                       v_a,
                                       v_b);
end;
