--����stage,api,
expdp 'xijia/"dba!@#"' schemas=stage dumpfile=stage.dmp logfile=stage.log directory=oracle_dmp;
expdp 'xijia/"dba!@#"' schemas=stage dumpfile=stage$(date +%Y%m%d).dmp logfile=stage$(date +%Y%m%d).log directory=oracle_dmp;
--����xijia
expdp 'xijia/"dba!@#"' schemas=xijia dumpfile=xijia$(date +%Y%m%d).dmp logfile=xijia$(date +%Y%m%d).log directory=oracle_dmp;
--����api
sname=api;
sfilename=${sname}$(date +%Y%m%d);
mypasswd=njust_api;
expdp 'xijia/"dba!@#"' schemas=${sname} dumpfile=${sfilename}.dmp logfile=${sfilename}.log directory=oracle_dmp encryption=data_only encryption_password=${my_passwd};

zip ${sfilename}.zip ${sfilename}.dmp

--���ܱ���
expdp 'xijia/xijia123' schemas=xj_dev dumpfile=xj_dev.dmp logfile=xj_dev.log directory=oracle_dmp encryption=data_only encryption_password=my_passwd compression=ALL;
--�����������
impdp 'xijia/xijia123' directory=oracle_dmp dumpfile=xj_dev20170117.dmp schemas=xj_dev encryption_password=my_passwd;
