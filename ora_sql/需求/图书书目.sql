select 
x.*,
s_end-s_start+1 vdate

 from (
select 
trim(replace(substr(CCHQJ,1,instr(CCHQJ,'-',1,1)-1),'/',null)) s_start,
trim(replace(substr(CCHQJ,instr(CCHQJ,'-',1,1)+1,length(CCHQJ)),'/',null)) s_end,
t.*
 from TEMP_TS2 t
where MARC_ID='0000328474') x

select 
*
 from TEMP_TS2 t
 where cchqj like '%H%'
