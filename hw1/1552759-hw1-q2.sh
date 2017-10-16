#!/bin/bash

student_id="1552759"

rm -f $log_file_name
log_file_name=${student_id}"-hw1-q2.log"
touch $log_file_name

line_num=0
time_diff=0
load_data=0
char_num=0

get_time_diff(){
	p1=`head -1 $1`
	p2=`tail -1 $1`
	init=`date -d "${p1:0:8}" +%s`
	end=`date -d "${p2:0:8}" +%s`
	return $((init-end))
}
 
read_file(){
	line_num=`sed -n '$=' $1`
	get_time_diff $1
	time_diff=`date -d "$?" +%H:%M:%S`
	load_data=`awk -F ',' '$5 != 0.00' $1 | wc -l`
	char_num=`awk '!(NR%2)' $1 | wc -m`
}

read_file $1

printf "$line_num\n$time_diff\n$load_data\n$char_num\n" > $log_file_name
