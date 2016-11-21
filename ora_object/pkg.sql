create or replace package pkg_etl_model is

  type date_table is table of date index by binary_integer;
  type number_table is table of number index by binary_integer;
  type varchar2_table is table of varchar2(50) index by binary_integer;

  function f_object_exist(in_object_name varchar2) return number;

  function f_object_valid(in_object_name varchar2) return varchar2;

  procedure p_insert_proc_relation(in_target_proc varchar2,
                                   in_source_proc varchar2,
                                   in_ready_time  varchar2,
                                   in_optname     varchar2,
                                   v_retcode      out varchar2,
                                   v_retinfo      out varchar2);

  procedure p_judge_run(out_procs out varchar2_table,
                        out_done  out number,
                        out_all   out number,
                        v_retcode out varchar2,
                        v_retinfo out varchar2);

  procedure p_create_table(create_table_name varchar2,
                           refer_table_name  varchar2,
                           v_retcode         out varchar2,
                           v_retinfo         out varchar2);

end pkg_etl_model;

