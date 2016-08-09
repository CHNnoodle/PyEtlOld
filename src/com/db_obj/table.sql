-- create table
create table t_log
(
  id         number(16) primary key,
  log_day    varchar2(10),
  proc_name  varchar2(256),
  start_time date,
  end_time   date,
  flag       varchar2(20),
  row_count  number(16),
  exec_time  number(16),
  ret_code   varchar2(20),
  ret_info   varchar2(256)
);
-- add comments to the columns 
comment on column t_log.id
  is '序列 主键';
comment on column t_log.log_day
  is '过程执行入参';
comment on column t_log.proc_name
  is '过程名称';
comment on column t_log.start_time
  is '开始执行时间';
comment on column t_log.end_time
  is '结束时间';
comment on column t_log.flag
  is '执行标识';
comment on column t_log.row_count
  is '记录行数';
comment on column t_log.exec_time
  is '执行时长';
comment on column t_log.ret_code
  is '执行完结信息';
comment on column t_log.ret_info
  is '错误代码';
--创建序列
create sequence seq_t_log
minvalue 1
maxvalue 999999999999999999999999999
start with 1185358
increment by 1
cache 20;

-- Create table
create table t_proc_relation
(
  target_proc     varchar2(50),
  source_proc   varchar2(50),
  source_number number(10),
  opt_name      varchar2(10),
  addtime       date,
  status        number(2)
);
-- add comments to the columns 
comment on column t_proc_relation.target_proc
  is '目标过程名称';
comment on column t_proc_relation.source_proc
  is '依赖过程名称';
comment on column t_proc_relation.source_number
  is '依赖过程数量';
comment on column t_proc_relation.opt_name
  is '数据添加人';
comment on column t_proc_relation.addtime
  is '数据添加时间';
comment on column t_proc_relation.status
  is '1-有效,0-无效';  

