--------------------------可以匹配到没有终端机号的商户代码
select distinct shdm,zdjh from xj_gl.t_d_ykt_grjy where shdm in (select shdm from dmn_zd where zdjh is null)
--反馈：这里是因为历史数据的原因导致的终端表缺少商户的信息，从金智同步的商户表来看，是不全的
--建议：这里不要把终端和商户表放一起，因为终端和商户不是一对一的，放一起如果只用zdjh关联会造成数据重复

------------------------终端高峰aam_ykt_xfqk_zdgf（数据少）     aam_ykt_zdqk
select datedm,sum(jyje),sum(jycs) from ykt_biee.aam_ykt_xfqk_zdgf where datedm in ('20160401','20161020','20161216') group by datedm;
select jyrq,sum(abs(jyje)),count(*) from xj_gl.t_d_ykt_grjy 
 where jyrq in ('2016-04-01','2016-10-20','2016-12-16')
 group by jyrq;
--反馈：这里的终端高峰不是剔除了充值的数据吗，这两个sql肯定会不一致的。

 -----------------------未消费人群（jgts不对）
select jgts,count(*) from ykt_biee.aam_ykt_ysslxsxx t group by jgts;

select * from ykt_biee.aam_ykt_ysslxsxx where kh='0000111223';
select * from ykt_biee.aam_ykt_ysslxssj where kh='0000111223';
select * from xj_gl.t_d_ykt_grjy 
where jlrq>='20160101'
and kh='0000111223'
order by jlrq desc;

select kh,jgts from ykt_biee.aam_ykt_ysslxsxx where jgts>150;
select max(jyrq), kh from xj_gl.t_d_ykt_grjy where kh in (select kh from ykt_biee.aam_ykt_ysslxsxx where jgts>150 and kh is not null)
 group by kh;
--反馈：数据已更新，请检查是否还有错误。

-------------------------学生消费汇总AAM_YKT_XFQK_XS（水电数据不对，然后有充值意外没消费类型的可以定义为其它，后期再加） 
select datedm,sum(jyje),sum(jycs),xflx,count(distinct kh) from ykt_biee.AAM_YKT_XFQK_XS
 where datedm in ('20160401','20161020','20161216') group by datedm,xflx;
select xs.datedm,sum(xs.jyje),count(*),zd.xflxmc,count(distinct kh)from ykt_biee.adm_ykt_xsxf xs
 left join ykt_biee.dmn_time ti on ti.timedm=xs.timedm
 left join ykt_biee.dmn_zd zd on zd.zdjh=xs.zdjh
 where datedm in ('20160401','20161020','20161216')
 group by xs.datedm,zd.xflxmc;
--反馈：这个是终端表滞后导致的不对称，在处理20160401的数据时，终端表缺失

--------------------------少数民族汇总AAM_YKT_XFQK_SSMZ（水电数据不对，未有消费类型的可以定义为其它）
select sum(jyje),sum(jycs),datedm,xflx from AAM_YKT_XFQK_SSMZ
 where datedm in ('20160401','20161020','20161216') group by datedm,xflx;
select sum(xs.jyje),count(*),xs.datedm,zd.xflxmc from adm_ykt_xsxf xs
 left join dmn_zd zd on zd.zdjh=xs.zdjh
 where xs.kh in (select kh from dmn_xs where kh is not null and mzdm!='01') and datedm in ('20160401','20161020','20161216')
 group by xs.datedm,zd.xflxmc;
 --反馈：同上
----------------------------保卫处关注人员AAM_YKT_XFQK_SSMZ_BWC(水电数据不对，未有消费类型的可以定义为其它)
select sum(jyje),sum(jycs),datedm,xflx from AAM_YKT_XFQK_SSMZ_BWC
 where datedm in ('20160401','20161020','20161216') group by datedm,xflx;
select sum(xs.jyje),count(*),xs.datedm,zd.xflxmc from adm_ykt_xsxf xs
 left join dmn_zd zd on zd.zdjh=xs.zdjh
 where datedm in ('20160401','20161020','20161216') and xs.kh in (select kh from dmn_xs_bwc where kh is not null)
 group by xs.datedm,zd.xflxmc;
 --反馈：同上
----------------------------学生是否消费aam_ykt_xssfxfqk(水电数据不对，未有消费类型的可以定义为其它)
select sum(xszs),sum(xfrs),datedm,xslb,cyqk from ykt_biee.aam_ykt_xssfxfqk
 where datedm in ('20160401','20161020','20161216') group by datedm,xslb,cyqk;
select count(distinct kh),xs.datedm,xs.xslb,zd.cyqk from ykt_biee.adm_ykt_xsxf xs
  left join dmn_zd zd on zd.zdjh=xs.zdjh
  left join dmn_zd z on z.shdm=xs.shdm
  where datedm in ('20160401','20161020','20161216')
  group by xs.datedm,xs.xslb,zd.cyqk;
   --反馈：同上
-----------------------------学生每日餐次消费AAM_YKT_XSMRCCXF(处理数据对不上，未有消费类型可以定义为其它)
select * from ykt_biee.AAM_YKT_XSMRCCXF where datedm in ('20160401','20161020','20161216');
select xs.datedm,xs.ccdm,x.xslb,sum(xs.jyje),sum(xs.jycs),count(distinct xs.kh) from ykt_biee.AAM_YKT_XFQK_XS xs
 left join ykt_biee.dmn_xs x on x.kh=xs.kh
 where xs.datedm in ('20160401','20161020','20161216') and xs.xflx!='充值'
 group by xs.datedm,xs.ccdm,x.xslb;
-----------------------------学生餐次消费情况AAM_YKT_XSCCXFQK(处理数据对不上)
select datedm,ccdm,sum(jyje),sum(jycs),count(distinct kh) from AAM_YKT_XSCCXFQK
 where datedm in ('20160401','20161020','20161216')
 group by datedm,ccdm;
select datedm,ccdm,sum(jyje),sum(jycs),count(distinct kh) from AAM_YKT_XFQK_XS
 where xflx!='充值' and xflx is not null and datedm in ('20160401','20161020','20161216')
 group by datedm,ccdm;
 
 --反馈：同上
