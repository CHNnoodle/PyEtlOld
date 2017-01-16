select *
  from (select distinct xijia.pkg_etl_model.f_object_valid(target_proc) x,
                        target_proc
          from xijia.t_proc_relation t
         where status = 1)
 where x is null;
 xj_ryxx.p_t_d_xsxx
