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
end;
