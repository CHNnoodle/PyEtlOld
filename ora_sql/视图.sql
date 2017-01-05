declare
  v_name      varchar2(200) := 'xj_ryxx.t_d_yjs';
  v_owner     varchar2(20);
  v_tablename varchar2(20);
  v_in        number;
begin
  select instr(v_name, '.') into v_in from dual;
  select substr(v_name, 1, v_in - 1),
         substr(v_name, v_in + 1, length(v_name))
    into v_owner, v_tablename
    from dual;
  dbms_output.put_line(v_owner);
  dbms_output.put_line(v_tablename);

  execute immediate 'create or replace view ' || v_owner || '.v_' ||
                    v_tablename || '
  as
  select * from ' || v_name || '
  where partid=to_char(sysdate-1,''dd'')
  ';

  for i in (select column_name, comments
              from all_col_comments
             where owner = upper(v_owner)
               and table_name = upper(v_tablename)) loop
    execute immediate 'comment on column ' || v_owner || '.v_' ||
                      v_tablename || '.' || i.column_name || ' is ''' ||
                      i.comments || '''';
  
  end loop;

  dbms_output.put_line('success');

end;
