declare
  v_a varchar2(200);
  v_b varchar2(200);

begin
  pkg_etl_model.p_insert_proc_relation('xj_weblog.p_t_visitlog', --Ŀ����� target
                                       '', --�������� source
                                       '', --�Ƿ�ϵͳ���� depen
                                       '2', --ͬ������ syn_type 1-��ͬ��
                                       '', --ͬ����ʽsyn_meths 1-�洢����ͬ��
                                       '2', --ͬ������syn_strategy 1-ȫ��
                                       '', --ready_time
                                       '240', --syn_time
                                       '����', --optname
                                       v_a,
                                       v_b);
                                       
end;
