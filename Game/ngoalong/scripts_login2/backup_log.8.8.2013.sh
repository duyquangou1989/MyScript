#!/bin/bash
# dungvv@vng.com.vn

userid=1024
groupid=1024
source_log=/home/ngoalonglog/data
destination_log=/bkfarm/log
dest_original_log=/bkfarm/original_log
audit_log=/bkfarm/AUDIT
#yesterday=$(date --date="yesterday" +"%Y-%m-%d")
yesterday=$1

server_key=( 26 28 )
server_ip[26]=118.102.7.30
server_ip[28]=118.102.7.32
server_name[26]=THIETLONG
server_name[28]=BALONG
# for manually
#yesterday=$1
#echo $yesterday

tdate1=`date +"%Y-%m-%d"`
tdate2=`date +"%Y%m%d %H:%M:%S"`
#tdate1="2012-04-06"
#tdate2="20120406 06:00:00"
mkdir $audit_log/$tdate1
echo "$tdate2 Starting backup logs to bkfarm" >> $audit_log/$tdate1/product_to_farm.log

for key in ${server_key[@]}
do
  if [ -e "$source_log/${yesterday}_${server_ip[$key]}.tar.gz" ]
  then
    tmp=$destination_log/$yesterday/${key}_${server_name[$key]}
    mkdir -p $tmp
    /bin/chown -R $userid:$groupid $destination_log/$yesterday
    cd $tmp
    tdate2=`date +"%Y%m%d %H:%M:%S"`
    echo "$tdate2 uncompressing file $source_log/${yesterday}_${server_ip[$key]}.tar.gz" >> $audit_log/$tdate1/product_to_farm.log
    /bin/tar -xzf $source_log/${yesterday}_${server_ip[$key]}.tar.gz >> $audit_log/$tdate1/product_to_farm.log
    /bin/chown -R $userid:$groupid $tmp && /bin/chmod -R 755 $tmp

    # copy original log
    cp $source_log/${yesterday}_${server_ip[$key]}.tar.gz $dest_original_log
  else
    tdate2=`date +"%Y%m%d %H:%M:%S"`
    echo "$tdate2 file $source_log/${yesterday}_${server_ip[$key]}.tar.gz is not exist" >> $audit_log/$tdate1/product_to_farm.log
  fi
done

tdate2=`date +"%Y%m%d %H:%M:%S"`
echo "$tdate2 Backup logs successful" >> $audit_log/$tdate1/product_to_farm.log

# remove old log
tcount=`ls -al $source_log | wc -l`
if [ $tcount -ge 30 ]
then
  tdate2=`date +"%Y%m%d %H:%M:%S"`
  yesterday=$(date --date="30 days ago" +"%Y-%m-%d")
  rm -f $source_log/*${yesterday}*
  echo "$tdate2 cleaning up ${source_log}/*${yesterday}*" >> $audit_log/$tdate1/product_to_farm.log
fi
