create table xj_gl.t_d_ykt_grjy
(
  jlrq  VARCHAR2(8),
  jyyf  VARCHAR2(6),
  kh    VARCHAR2(20),
  jyrq  VARCHAR2(10),
  jysj  VARCHAR2(10),
  jydd  VARCHAR2(180),
  jylx  VARCHAR2(70),
  jylsh VARCHAR2(40),
  shdm  VARCHAR2(10),
  zdjh  VARCHAR2(60),
  jyje  NUMBER(10,2),
  jyye  NUMBER(10,2),
  klx   VARCHAR2(90),
  kjs   INTEGER,
  srje  NUMBER(10,2)
) partition by range(jlrq)
(partition part2013 values less than ('20140101'),
 partition part2014 values less than ('20150101'),
 partition part2015 values less than ('20160101'), 
 partition part20160101 values less than ('20160102'));
alter table xj_gl.t_d_ykt_grjy add partition part20160102 values less than ('20160103')
