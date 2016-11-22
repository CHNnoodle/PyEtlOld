select * from SYS.all_col_comments
where owner='STAGE'
and table_name like '%KY%'
AND SUBSTR(COLUMN_NAME,-2)='DM'
AND COMMENTS IS NOT NULL;
