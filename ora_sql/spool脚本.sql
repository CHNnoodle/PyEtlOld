select 'select ' || column_name || ' from ' || owner || '.' || table_name
  from (select owner,
               table_name,
               listagg(column_name, '||''|*|''||') within group(order by column_id) column_name
          from sys.all_tab_cols t
         where owner = 'STAGE_LOG'
           and table_name = 'T_USERINFO'
         group by owner, table_name)
