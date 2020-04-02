#!/bin/bash
#NUM=$1
#rev=0
#total=0
#
#while [ $NUM -gt 0 ]
#do
#	NUM1=$(($NUM%10))
#	for i in $NUM1
#	do
#		echo $i
#	done
#	NUM=$(($NUM/10))
#	rev=$(($NUM1 + $rev*10))
#	total=$(($NUM1 + $total))
#done
#echo $rev
#echo "Total = $total"
#x1=$(((-$2) + ((sqrt $delta) / (2 * $1))))
#usapro_2203 | maihoa2010 | 

#function lower()
#{
#	echo $1 | tr '[:upper:]' '[:lower:]'
#}

while :
do
	echo "1.Date"
	echo "2.Location "
	echo "3.Exit"
	echo -p "Nhap : " input
	case $input in
		1) echo $(date);;
		2) pwd ;;
		3) exit;;
		*) echo "1 2 3 please ";;
	esac
done
#222-228 110-114

#PS1='\[\033[01;31m\]\u\[\033[00m\]\[\033[00;31m\]@\[\033[00m\]\[\033[00;33m\]\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00m\]\$'
