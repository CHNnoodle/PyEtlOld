create sequence xijiaweb.seq_undergraduate_courses 
start with 1 
increment by 1 
minvalue 1 
maxvalue 9999999999 
nocycle 
nocache; 


create  trigger xijiaweb.tgr_undergraduate_courses 
before insert on xijiaweb.undergraduate_courses 
for each row
begin
    select seq_undergraduate_courses .nextval into:new.id from sys.dual;
end;
