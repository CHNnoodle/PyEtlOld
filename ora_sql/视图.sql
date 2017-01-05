declare
  v_name varchar2(200) := 'xj_gl.t_d_ykt_kh';
  v_in   number;
begin
  select instr(v_name, '.') into v_in from dual;

  execute immediate 'create or replace view ' ||
                    substr(v_name, 1, v_in - 1) || '.v_' ||
                    substr(v_name, v_in + 1, length(v_name)) || '
as
select * from ' || v_name || '
where partid=to_char(sysdate-1,''dd'')
';
  dbms_output.put_line('success');

end;
