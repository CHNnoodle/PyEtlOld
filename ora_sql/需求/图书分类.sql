insert into xijiaweb.book_categories
select 
dm id ,
dm code , 
mc name , 
sjdm father_id,
cc level1 ,
null priority ,
null created_at ,
null updated_at 
 from xj_code.code_ts_fl_ktf
