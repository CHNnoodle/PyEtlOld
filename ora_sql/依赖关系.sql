declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_insert_proc_relation('xj_weblog.p_t_visitlog', --目标过程 target
                                       '', --依赖过程 source
                                       '', --是否系统依赖 depen
                                       '2', --同步类型 syn_type 1-日同步
                                       '', --同步方式syn_meths 1-存储过程同步
                                       '2', --同步策略syn_strategy 1-全量
                                       '', --ready_time
                                       '240', --syn_time
                                       '王刚', --optname
                                       v_a,
                                       v_b);
                                       
end;
