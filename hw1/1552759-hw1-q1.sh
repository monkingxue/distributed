#!/bin/bash

student_id="1552759"

log_file_name=${student_id}"-hw1-q1.log"
rm -f $log_file_name
touch $log_file_name

times=100
for t in $(seq 1 $times)
do
	uptime >> $log_file_name
	sleep 1
done
