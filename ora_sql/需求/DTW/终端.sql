--一卡通终端对应窗口名称手动维护表
select * from xj_gl.t_sd_ykt_zd t;
create table xj_code.code_ykt_zd as
select distinct zdjh,shdm,jydd zddd from xj_gl.t_d_ykt_grjy
where jlrq between '20161201' and '20161215';

update xj_code.code_ykt_zd t1 set ck=(
select ck from xj_gl.t_sd_ykt_zd t2
where t1.zdjh=t2.zdjh)




--一卡通商户分类手动维护表
select * from xj_gl.t_sd_ykt_sh t;
update xj_gl.t_sd_ykt_sh t set xflxmc =
(select xflxmc from 
(select distinct shdm,xflxmc from ykt_biee.dmn_zd) x
where t.shdm=x.shdm);
update xj_gl.t_sd_ykt_sh t set CYQK =
(select CYQK from 
(select distinct shdm,CYQK from ykt_biee.dmn_zd) x
where t.shdm=x.shdm);
--获取手工数据缺失的商户
merge into xj_gl.t_sd_ykt_sh t1
using 
(select shdm,shmc from xj_gl.t_d_ykt_sh
where partid='15')  t2
on (t1.shdm=t2.shdm)
  when not matched then
    insert
      (wid,shdm,shmc)
    values
      (t2.shdm,t2.shdm,t2.shmc);

