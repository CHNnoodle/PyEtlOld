declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_insert_proc_relation('ykt_biee.p_aam_sy_month_xs_b', --Ŀ�����
                                       'cwgl.p_aam_ykt_xfqk_xs,cwgl.p_dmn_xs', --��������
                                       '',
                                       '����',
                                       v_a,
                                       v_b);
                                       
end;
