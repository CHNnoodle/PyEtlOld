select * from xijia.njust_book t;

select * from xijia.njust_book t
where dxzwm like '%选课%';

select * from xijia.njust_book t
where ywxl='��������';

select * from stage.t_bzks_jxj;

update xijia.njust_book set dxm='STAGE.'||dxm
