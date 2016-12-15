--insert into xj_ryxx.t_d_ryxx
create table t_test as
select 
wid,
         xh,
         x2.kh,
         '1' xslx,
         case when sfzx=1 or lasttime is not null then 1 else 0 end sfzx,
         xm,
         xmpy,
         cym,
         xbdm,
         csrq,
         mzdm,
         sfzjlxdm,
         sfzjh,
         jgdm,
         csddm,
         zzmmdm,
         syddm,
         hssbkdm,
         hkszd,
         pyfsdm,
         dwdm,
         zydm,
         xslbdm,
         rxrq,
         rxnj,
         xznj,
         bh,
         xzdm,
         xjztdm,
         jkzkdm,
         clrq,
         czlx,
         sfzx sfztzx,
         x2.kpztdm,
         x3.lasttime,
         sysdate opt_time,
         ' ' source_flag
 from (
  select 
         wid,
         xh,
         '1' xslx,
         xm,
         xmpy,
         cym,
         xbdm,
         csrq,
         mzdm,
         sfzjlxdm,
         sfzjh,
         jgdm,
         csddm,
         zzmmdm,
         syddm,
         hssbkdm,
         hkszd,
         pyfsdm,
         dwdm,
         zydm,
         xslbdm,
         rxrq,
         rxnj,
         xznj,
         bh,
         xzdm,
         xjztdm,
         jkzkdm,
         clrq,
         czlx,
         case when rxnj>='2013' then 1 else 0 end sfzx
    from xj_ryxx.t_d_bzks t
   where partid = '12'
   and xjztdm='01'
  union all
  select 
         wid,
         xh,
         t2.lm xslx,
         xm,
         xmpy,
         cym,
         xbdm,
         csrq,
         mzdm,
         sfzjlxdm,
         sfzjh,
         jgdm,
         csddm,
         zzmmdm,
         syddm,
         hssbkdm,
         hkszd,
         pyfsdm,
         dwdm,
         zydm,
         xslbdm,
         rxrq,
         rxnj,
         xznj,
         bh,
         xz xzdm,
         xjztdm,
         jkzkdm,
         clrq,
         czlx,
         case when t2.lm='2' and rxnj>='2013' then 1 
           when t2.lm='3' and rxnj>='2009' then 1 
             else 0 end sfzx
    from xj_ryxx.t_d_yjs t1,xj_code.code_xslb_xb t2
   where partid = '12'
   and xjztdm='1'
   and t2.lm='2'
   and t1.xslbdm=t2.dm(+)£©x1,(select kh,sfrzh,kpztdm from XJ_GL.T_D_YKT_KH t
where partid='12') x2,
(select kh,lasttime from xj_gl.t_d_lastaction t
where  jlrq='20161212'
and lasttime>=to_date('20160822','yyyymmdd') ) x3
where x1.xh=x2.sfrzh(+)
and x2.kh=x3.kh(+);
   
