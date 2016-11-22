select * from xijia.njust_book t;

select * from xijia.njust_book t
where dxzwm like '%金%';

select * from xijia.njust_book t
where ywxl='资助管理';

select * from stage.t_bzks_jxj;

update xijia.njust_book set dxm='STAGE.'||dxm
