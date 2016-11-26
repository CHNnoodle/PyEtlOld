SELECT tablespace_name 表空间, sum(blocks * 8192 / 1000000) 剩余空间M
  FROM dba_free_space
 GROUP BY tablespace_name;

select b.name, sum(a.bytes / 1000000) 总空间
  from v$datafile a, v$tablespace b
 where a.ts# = b.ts#
 group by b.name;

select

 　　a.a1 表空间名称,
 
 　　c.c2 类型,
 
 　　c.c3 区管理,
 
 　　b.b2 / 1024 / 1024 表空间大小M,
 
 　　(b.b2 - a.a2) / 1024 / 1024 已使用M,
 
 　　substr((b.b2 - a.a2) / b.b2 * 100, 1, 5) 利用率
 　　from
 　　 (select tablespace_name a1, sum(nvl(bytes, 0)) a2
       from dba_free_space
      group by tablespace_name) a,
 　　 (select tablespace_name b1, sum(bytes) b2
       from dba_data_files
      group by tablespace_name) b,
 　　 (select tablespace_name c1, contents c2, extent_management c3
       from dba_tablespaces) c
  　　where a.a1 = b.b1 and c.c1 = b.b1;

select *
  from (select owner, segment_name, bytes
          from dba_segments
        --where owner = USER
         order by bytes desc)
 where rownum <= 30;

truncate table cwgl.T_D_YKT_KH;
