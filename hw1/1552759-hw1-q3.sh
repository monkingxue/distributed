#!/bin/bash

student_id="1552759"

log_file_name=${student_id}"-hw1-q3.log"
rm -f $log_file_name
touch $log_file_name

sr_file_name=${student_id}'-hw1-q1.log'
old_ts=`date +%s -r $sr_file_name`

new_ts=`ssh -i ./DIST_SYS.pem linux1@148.100.4.99 << deof
#sh 1552759-hw1-q1.sh
#sleep($((100*10)))
date +%s -r $sr_file_name
exit

echo `date -d @"$((new_ts-old_ts+57600))" +%T` > $log_file_name

