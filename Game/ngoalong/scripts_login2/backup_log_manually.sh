#!/bin/bash
userid=1024
groupid=1024
source_log=/home/ngoalonglog/data
destination_log=/bkfarm/log
audit_log=/bkfarm/AUDIT
yesterday=$(date --date="yesterday" +"%Y-%m-%d")

server_key=( 2 )
server_ip[2]=118.102.7.6
server_name[2]=HOALONG

# for manually
yesterday=$1
echo $yesterday

tdate1=`date +"%Y-%m-%d"`
tdate2=`date +"%Y%m%d %H:%M:%S"`
mkdir $audit_log/$tdate1
echo "$tdate2 Starting backup logs to bkfarm" >> $audit_log/$tdate1/product_to_farm.log

for key in ${server_key[@]}
do
  if [ -e "$source_log/${yesterday}_${server_ip[$key]}.tar.gz" ]
  then
    tmp=$destination_log/$yesterday/${key}_${server_name[$key]}
    mkdir -p $tmp
    cd $tmp
    tdate2=`date +"%Y%m%d %H:%M:%S"`
    echo "$tdate2 uncompressing file $source_log/${yesterday}_${server_ip[$key]}.tar.gz" >> $audit_log/$tdate1/product_to_farm.log
    /bin/tar -xzf $source_log/${yesterday}_${server_ip[$key]}.tar.gz >> $audit_log/$tdate1/product_to_farm.log
    /bin/chown -R $userid:$groupid $tmp && /bin/chmod -R 755 $tmp
  else
    tdate2=`date +"%Y%m%d %H:%M:%S"`
    echo "$tdate2 file $source_log/${yesterday}_${server_ip[$key]}.tar.gz is not exist" >> $audit_log/$tdate1/product_to_farm.log
  fi
done

tdate2=`date +"%Y%m%d %H:%M:%S"`
echo "$tdate2 Backup logs successful" >> $audit_log/$tdate1/product_to_farm.log
