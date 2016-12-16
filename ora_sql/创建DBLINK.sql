create public database link GSK connect to usr_xijia identified by "cumt76#21*xj"
¡¡¡¡ using '  (DESCRIPTION = 
    (ADDRESS_LIST = 
      (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.102.209)(PORT = 1521)) 
    ) 
    (CONNECT_DATA = 
      (SERVER = DEDICATED)
      (SERVICE_NAME = kfptdb) 
    ) 
  ) ';
  
  SELECT * FROM ALL_TABLES@GSK
