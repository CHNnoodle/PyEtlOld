--------------------------����ƥ�䵽û���ն˻��ŵ��̻�����
select distinct shdm,zdjh from xj_gl.t_d_ykt_grjy where shdm in (select shdm from dmn_zd where zdjh is null)
--��������������Ϊ��ʷ���ݵ�ԭ���µ��ն˱�ȱ���̻�����Ϣ���ӽ���ͬ�����̻����������ǲ�ȫ��
--���飺���ﲻҪ���ն˺��̻����һ����Ϊ�ն˺��̻�����һ��һ�ģ���һ�����ֻ��zdjh��������������ظ�

------------------------�ն˸߷�aam_ykt_xfqk_zdgf�������٣�     aam_ykt_zdqk
select datedm,sum(jyje),sum(jycs) from ykt_biee.aam_ykt_xfqk_zdgf where datedm in ('20160401','20161020','20161216') group by datedm;
select jyrq,sum(abs(jyje)),count(*) from xj_gl.t_d_ykt_grjy 
 where jyrq in ('2016-04-01','2016-10-20','2016-12-16')
 group by jyrq;
--������������ն˸߷岻���޳��˳�ֵ��������������sql�϶��᲻һ�µġ�

 -----------------------δ������Ⱥ��jgts���ԣ�
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
--�����������Ѹ��£������Ƿ��д���

-------------------------ѧ�����ѻ���AAM_YKT_XFQK_XS��ˮ�����ݲ��ԣ�Ȼ���г�ֵ����û�������͵Ŀ��Զ���Ϊ�����������ټӣ� 
select datedm,sum(jyje),sum(jycs),xflx,count(distinct kh) from ykt_biee.AAM_YKT_XFQK_XS
 where datedm in ('20160401','20161020','20161216') group by datedm,xflx;
select xs.datedm,sum(xs.jyje),count(*),zd.xflxmc,count(distinct kh)from ykt_biee.adm_ykt_xsxf xs
 left join ykt_biee.dmn_time ti on ti.timedm=xs.timedm
 left join ykt_biee.dmn_zd zd on zd.zdjh=xs.zdjh
 where datedm in ('20160401','20161020','20161216')
 group by xs.datedm,zd.xflxmc;
--������������ն˱��ͺ��µĲ��Գƣ��ڴ���20160401������ʱ���ն˱�ȱʧ

--------------------------�����������AAM_YKT_XFQK_SSMZ��ˮ�����ݲ��ԣ�δ���������͵Ŀ��Զ���Ϊ������
select sum(jyje),sum(jycs),datedm,xflx from AAM_YKT_XFQK_SSMZ
 where datedm in ('20160401','20161020','20161216') group by datedm,xflx;
select sum(xs.jyje),count(*),xs.datedm,zd.xflxmc from adm_ykt_xsxf xs
 left join dmn_zd zd on zd.zdjh=xs.zdjh
 where xs.kh in (select kh from dmn_xs where kh is not null and mzdm!='01') and datedm in ('20160401','20161020','20161216')
 group by xs.datedm,zd.xflxmc;
 --������ͬ��
----------------------------��������ע��ԱAAM_YKT_XFQK_SSMZ_BWC(ˮ�����ݲ��ԣ�δ���������͵Ŀ��Զ���Ϊ����)
select sum(jyje),sum(jycs),datedm,xflx from AAM_YKT_XFQK_SSMZ_BWC
 where datedm in ('20160401','20161020','20161216') group by datedm,xflx;
select sum(xs.jyje),count(*),xs.datedm,zd.xflxmc from adm_ykt_xsxf xs
 left join dmn_zd zd on zd.zdjh=xs.zdjh
 where datedm in ('20160401','20161020','20161216') and xs.kh in (select kh from dmn_xs_bwc where kh is not null)
 group by xs.datedm,zd.xflxmc;
 --������ͬ��
----------------------------ѧ���Ƿ�����aam_ykt_xssfxfqk(ˮ�����ݲ��ԣ�δ���������͵Ŀ��Զ���Ϊ����)
select sum(xszs),sum(xfrs),datedm,xslb,cyqk from ykt_biee.aam_ykt_xssfxfqk
 where datedm in ('20160401','20161020','20161216') group by datedm,xslb,cyqk;
select count(distinct kh),xs.datedm,xs.xslb,zd.cyqk from ykt_biee.adm_ykt_xsxf xs
  left join dmn_zd zd on zd.zdjh=xs.zdjh
  left join dmn_zd z on z.shdm=xs.shdm
  where datedm in ('20160401','20161020','20161216')
  group by xs.datedm,xs.xslb,zd.cyqk;
   --������ͬ��
-----------------------------ѧ��ÿ�ղʹ�����AAM_YKT_XSMRCCXF(�������ݶԲ��ϣ�δ���������Ϳ��Զ���Ϊ����)
select * from ykt_biee.AAM_YKT_XSMRCCXF where datedm in ('20160401','20161020','20161216');
select xs.datedm,xs.ccdm,x.xslb,sum(xs.jyje),sum(xs.jycs),count(distinct xs.kh) from ykt_biee.AAM_YKT_XFQK_XS xs
 left join ykt_biee.dmn_xs x on x.kh=xs.kh
 where xs.datedm in ('20160401','20161020','20161216') and xs.xflx!='��ֵ'
 group by xs.datedm,xs.ccdm,x.xslb;
-----------------------------ѧ���ʹ��������AAM_YKT_XSCCXFQK(�������ݶԲ���)
select datedm,ccdm,sum(jyje),sum(jycs),count(distinct kh) from AAM_YKT_XSCCXFQK
 where datedm in ('20160401','20161020','20161216')
 group by datedm,ccdm;
select datedm,ccdm,sum(jyje),sum(jycs),count(distinct kh) from AAM_YKT_XFQK_XS
 where xflx!='��ֵ' and xflx is not null and datedm in ('20160401','20161020','20161216')
 group by datedm,ccdm;
 
 --������ͬ��
