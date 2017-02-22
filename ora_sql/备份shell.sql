#!/bin/bash

sname=api
sfilename=${sname}$(date +%Y%m%d)
sbakname=${sname}$(date -d "-2 day" +%Y%m%d)
my_passwd=njust_${sname}

rm -f /home/oracle/oracle_dmp/${sfilename}.dmp;
rm -f /home/oracle/oracle_dmp/${sfilename}.log;

expdp 'xijia/"dba!@#"' schemas=${sname} dumpfile=${sfilename}.dmp logfile=${sfilename}.log directory=oracle_dmp encryption=data_only encryption_password=${my_passwd} compression=ALL;

rm -f /home/oracle/oracle_dmp/${sfilename}.dmp
