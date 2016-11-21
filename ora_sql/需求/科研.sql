insert into ykt_biee.dmn_jzg
  (jlrq,
   wid,
   zgh,
   xm,
   xb,
   csrq,
   jg,
   mz,
   sfzjlxdm,
   sfzjh,
   cjgzrq,
   lxrq,
   cjrq,
   zzmm,
   hkszd,
   szdwdm,
   yrfs,
   dqzt,
   zgxl,
   byrq,
   byxx,
   xw,
   dslb,
   xklb,
   zyjszw,
   zyjszwjb,
   przyjszw,
   przyjszwjb,
   dzzw)

  select jlrq,
         wid,
         zgh,
         xm,
         t14.mc   xb,
         csrq,
         t13.mc   jg,
         t12.mc   mz,
         sfzjlxdm,
         sfzjh,
         cjgzrq,
         lxrq,
         cjrq,
         t11.mc   zzmm,
         hkszd,
         szdwdm,
         t10.mc   yrfs,
         t9.mc    dqzt,
         t8.mc    zgxl,
         byrq,
         byxx,
         t7.mc    xw,
         t6.mc    dslb,
         t15.mc   xklb,
         t5.mc    zyjszw,
         t4.mc    zyjszwjb,
         t3.mc    przyjszw,
         t2.mc    przyjszwjb,
         dzzw
    from xj_ryxx.t_d_jzg    t1,
         xj_code.code_zwjb  t2,
         xj_code.code_zw    t3,
         xj_code.code_zwjb  t4,
         xj_code.code_zw    t5,
         xj_code.code_dslb  t6,
         xj_code.code_xw    t7,
         xj_code.code_xl    t8,
         xj_code.code_jzgzt t9,
         xj_code.code_yrfs  t10,
         xj_code.code_zzmm  t11,
         xj_code.code_mz    t12,
         xj_code.code_dq    t13,
         xj_code.code_xb    t14,
         xj_code.code_xkml  t15
   where partid = '20'
     and t1.przyjszwjbdm = t2.dm(+)
     and t1.przyjszwdm = t3.dm(+)
     and t1.zyjszwjbdm = t4.dm(+)
     and t1.zyjszwdm = t5.dm(+)
     and t1.dslbdm = t6.dm(+)
     and t1.xwdm = t7.dm(+)
     and t1.zgxldm = t8.dm(+)
     and t1.dqztdm = t9.dm(+)
     and t1.yrfsdm = t10.dm(+)
     and t1.zzmmdm = t11.dm(+)
     and t1.mzdm = t12.dm(+)
     and t1.jgdm = t13.dm(+)
     and t1.xbdm = t14.dm(+)
     and t1.xklbdm = t15.dm(+)
