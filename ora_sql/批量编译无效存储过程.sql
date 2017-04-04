SELECT 'ALTER ' || object_type || ' ' || owner || '.' || object_name ||
       ' COMPILE;'
FROM dba_objects t1,xijia.t_user t2
WHERE t1.OWNER=upper(t2.user_name)
and status <> 'VALID'
and object_type='PROCEDURE';
