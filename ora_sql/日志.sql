select * from xijia.t_log
where proc_name like '%xj_gl%'
order by 1 desc;
select * from xijia.t_proc_relation
where target_proc like '%xijia%';

delete from xijia.t_log
where log_day='20161206';
