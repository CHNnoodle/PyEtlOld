insert into xijiaweb.departments
  (num, name, parent_num)
  select dm num, mc name, ls parent_num from xj_code.code_dw where sfsy = 1
