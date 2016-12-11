create table YKT_BIEE.ADM_YKT_XSXF_p
(
  datedm VARCHAR2(10),
  timedm VARCHAR2(10),
  kh     VARCHAR2(20),
  zdjh   VARCHAR2(10),
  jyje   NUMBER,
  shdm   VARCHAR2(20),
  czje   NUMBER
)
partition by range(datedm)
(partition part201601 values less than ('20160201'),
partition part201602 values less than ('20160202'));

insert into YKT_BIEE.ADM_YKT_XSXF_p
select * from YKT_BIEE.ADM_YKT_XSXF;
commit;

drop table YKT_BIEE.ADM_YKT_XSXF;
alter table YKT_BIEE.ADM_YKT_XSXF_p rename to ADM_YKT_XSXF
