declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_insert_proc_relation('ykt_biee.p_aam_sy_month_xs_b', --目标过程
                                       'cwgl.p_aam_ykt_xfqk_xs,cwgl.p_dmn_xs', --依赖过程
                                       '',
                                       '王刚',
                                       v_a,
                                       v_b);
                                       
end;
