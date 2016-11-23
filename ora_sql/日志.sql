select * from xijia.t_log
where proc_name like '%xijia%'
order by 1 desc;
select * from xijia.t_proc_relation
where target_proc like '%xijia%';

select * from stage.t_ky_
