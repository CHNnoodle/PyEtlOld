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
  is '���� ����';
comment on column t_log.log_day
  is '����ִ�����';
comment on column t_log.proc_name
  is '��������';
comment on column t_log.start_time
  is '��ʼִ��ʱ��';
comment on column t_log.end_time
  is '����ʱ��';
comment on column t_log.flag
  is 'ִ�б�ʶ';
comment on column t_log.row_count
  is '��¼����';
comment on column t_log.exec_time
  is 'ִ��ʱ��';
comment on column t_log.ret_code
  is 'ִ�������Ϣ';
comment on column t_log.ret_info
  is '�������';
--��������
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
  is 'Ŀ���������';
comment on column t_proc_relation.source_proc
  is '������������';
comment on column t_proc_relation.source_number
  is '������������';
comment on column t_proc_relation.opt_name
  is '���������';
comment on column t_proc_relation.addtime
  is '�������ʱ��';
comment on column t_proc_relation.status
  is '1-��Ч,0-��Ч';  

