declare
v_name varchar2(200):='undergraduate_courses';
begin
dbms_output.put_line(v_name);
execute immediate 'create sequence xijiaweb.seq_'||v_name||'
start with 1 
increment by 1 
minvalue 1 
maxvalue 9999999999 
nocycle 
nocache';

execute immediate 'create or replace trigger xijiaweb.tgr_'||v_name||'
before insert on xijiaweb.'||v_name||'
for each row
begin
    select seq_'||v_name||'.nextval into:new.id from sys.dual;
end;';
dbms_output.put_line('success');

end;
/*
create sequence xijiaweb.seq_card_transactions
start with 1 
increment by 1 
minvalue 1 
maxvalue 9999999999 
nocycle 
nocache; 


create or replace trigger xijiaweb.tgr_card_transactions 
before insert on xijiaweb.card_transactions
for each row
begin
    select seq_card_transactions.nextval into:new.id from sys.dual;
end;*/
