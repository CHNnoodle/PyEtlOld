select * from SYS.all_col_comments
where owner='STAGE'
and table_name IN ('T_BZKS_KC','T_BZKS_XK','T_BZKS_KK','T_BZKS_PK')
AND SUBSTR(COLUMN_NAME,-2)='DM'
AND COMMENTS IS NOT NULL;
