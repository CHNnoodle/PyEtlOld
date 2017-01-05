declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_create_his_table('stage.t_yjs', --数据源表
   v_a, v_b);

end;
