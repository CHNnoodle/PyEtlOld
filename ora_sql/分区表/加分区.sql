declare
  v_partid varchar2(20) := '20160302';
  v_sql    long;
begin
  for i in 1 .. 360 loop
    v_sql := 'alter table xijiaweb.card_transactions2 add partition part' ||
             v_partid || ' values less than (''' ||
             to_char(to_date(v_partid, 'yyyymmdd') + 1, 'yyyymmdd') || ''')';
    --dbms_output.put_line(v_sql);
    execute immediate v_sql;
    v_partid := to_char(to_date(v_partid, 'yyyymmdd') + 1, 'yyyymmdd');
  end loop;
end;

/*
declare
  v_partid varchar2(20) := '201603';
  v_sql    long;
begin
  for i in 1 .. 24 loop
    v_sql := 'alter table YKT_BIEE.ADM_YKT_XSXF_p add partition part' ||
             v_partid || ' values less than (''' ||
             to_char(add_months(to_date(v_partid, 'yyyymm') ,1), 'yyyymmdd') || ''')';
    --dbms_output.put_line(v_sql);
    execute immediate v_sql;
    v_partid := to_char(add_months(to_date(v_partid, 'yyyymm') ,1), 'yyyymm');
  end loop;
end;*/
