declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_insert_proc_relation('xijia.p_aam_ky_hjcg', --Ŀ�����
                                       'xj_gl.p_t_d_ky_cghj', --��������
                                       '',
                                       '����',
                                       v_a,
                                       v_b);
end;
