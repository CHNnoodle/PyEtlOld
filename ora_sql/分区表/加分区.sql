declare
  v_partid varchar2(20) := '20160429';
  v_sql    long;
begin
  for i in 1 .. 360 loop
    v_sql := 'alter table xj_gl.t_d_ykt_grjy add partition part' ||
             v_partid || ' values less than (''' ||
             to_char(to_date(v_partid, 'yyyymmdd') + 1, 'yyyymmdd') || ''')';
    --dbms_output.put_line(v_sql);
    execute immediate v_sql;
    v_partid := to_char(to_date(v_partid, 'yyyymmdd') + 1, 'yyyymmdd');
  end loop;
end;
