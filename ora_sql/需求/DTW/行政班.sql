select * from ykt_biee.dmn_xzb

select distinct dwdm yxdm,t2.mc yxmc, zydm,
case when t1.xslx=1 then t4.mc else t5.mc end zymc,
case when t1.xslx=1 then t1.bh else t1.dwdm||t1.zydm end xzbmc,
t3.dwjc yxjc
  from xj_ryxx.t_d_xsxx  t1,
       xj_code.code_dw   t2,
       xj_code.code_dwjc t3,
       xj_code.code_bkszy   t4,
       xj_code.code_yjszy   t5
 where t1.dwdm = t2.dm(+) 
 and t1.dwdm = t3.dm(+)
 and  t1.zydm = t4.dm(+)
and  t1.zydm = t5.dm(+)
and t1.partid='15'
