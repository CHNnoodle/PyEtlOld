--表空间剩余情况
select tablespace_name 表空间, sum(blocks * 8192 / 1000000) 剩余空间M
  from dba_free_space
 group by tablespace_name;

--表空间总体情况
select b.name,a.name filename,sum(a.bytes / 1000000) 总空间M
  from v$datafile a, v$tablespace b
 where a.ts# = b.ts#
 group by b.name,a.name;


--表空间分析情况
select 　　a.a1 表空间名称,
       　　c.c2 类型,
       　　c.c3 区管理,
       　　b.b2 / 1024 / 1024 表空间大小M,
       　　(b.b2 - a.a2) / 1024 / 1024 已使用M,
       　　substr((b.b2 - a.a2) / b.b2 * 100, 1, 5) 利用率 　　
  from 　　 (select tablespace_name a1, sum(nvl(bytes, 0)) a2
             from dba_free_space
            group by tablespace_name) a,
       　　 (select tablespace_name b1, sum(bytes) b2
             from dba_data_files
            group by tablespace_name) b,
       　　 (select tablespace_name c1, contents c2, extent_management c3
             from dba_tablespaces) c 　　where a.a1 = b.b1 and c.c1 = b.b1;
            
alter tablespace users add datafile '+DATA/orclrac/datafile/users5.dbf'size 100m 
autoextend on next 100m maxsize 32000m         

select *
  from (select owner, segment_name, sum(bytes/1024/1024) "bytes(M)"
          from dba_segments
         group by owner, segment_name
         order by 3 desc)
 where rownum <= 30;
 
 
