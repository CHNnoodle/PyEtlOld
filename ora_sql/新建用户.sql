--�½��û�
create user xj_gl identified by njust_xjgl;
--����Ȩ��
grant connect,resource,create view,create database link,unlimited tablespace to xj_gl;
--����Ȩ��
grant create session, create any table, create any view ,create any index, create any procedure,
����alter any table, alter any procedure,
����drop any table, drop any view, drop any index, drop any procedure,
����select any table, insert any table, update any table, delete any table
to xj_gl;
grant select any sequence to xj_gl;
grant all on xijia.pkg_etl_model to xj_gl;
grant debug connect SESSION to xj_gl;
