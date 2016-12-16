insert into xj_code.code_bkszy
select dm, 
mc, 
cc, 
sjdm, 
sfsy
 from (
select t.*,
row_number()over(partition by dm order by mc) rd
 from xj_code.code_demo t)
 where rd=1
