truncate table xijiaweb.undergraduate_majors;
insert into xijiaweb.undergraduate_majors
(major_code, major_name )
select dm,mc from xj_code.code_bkszy
