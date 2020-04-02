#!/bin/bash

userid=1024
groupid=1024
source_log=/home/ngoalonglog/data
destination_log=/bkfarm/log
dest_original_log=/bkfarm/original_log
audit_log=/bkfarm/AUDIT
#yesterday=$(date --date="yesterday" +"%Y-%m-%d")
yesterday=$1

server_key=( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 45 47 48 49 50 51 )
server_ip[1]=118.102.7.4
server_ip[2]=118.102.7.6
server_ip[3]=118.102.7.7
server_ip[4]=118.102.7.9
server_ip[5]=118.102.7.8
server_ip[6]=118.102.7.10
server_ip[7]=118.102.7.11
server_ip[8]=118.102.7.12
server_ip[9]=118.102.7.13
server_ip[10]=118.102.7.14
server_ip[11]=118.102.7.15
server_ip[12]=118.102.7.16
server_ip[13]=118.102.7.17
server_ip[14]=118.102.7.18
server_ip[15]=118.102.7.19
server_ip[16]=118.102.7.20
server_ip[17]=118.102.7.21
server_ip[18]=118.102.7.22
server_ip[19]=118.102.7.23
server_ip[20]=118.102.7.24
server_ip[21]=118.102.7.25
server_ip[22]=118.102.7.26
server_ip[23]=118.102.7.27
server_ip[24]=118.102.7.28
server_ip[25]=118.102.7.29
server_ip[26]=118.102.7.30
server_ip[27]=118.102.7.31
server_ip[28]=118.102.7.32
server_ip[29]=118.102.7.33
server_ip[30]=118.102.7.34
server_ip[31]=118.102.7.35
server_ip[32]=118.102.7.36
server_ip[33]=118.102.7.37
server_ip[34]=118.102.7.38
server_ip[35]=118.102.7.39
server_ip[36]=118.102.7.40
server_ip[37]=118.102.7.41
server_ip[38]=118.102.7.42
server_ip[39]=118.102.7.43
server_ip[40]=118.102.7.44
server_ip[41]=118.102.7.45
server_ip[42]=118.102.7.46
server_ip[43]=118.102.7.50
server_ip[45]=118.102.7.49
server_ip[47]=118.102.7.51
server_ip[48]=118.102.7.52
server_ip[49]=118.102.7.53
server_ip[50]=118.102.7.54
server_ip[51]=118.102.7.55
server_name[1]=KIMLONG
server_name[2]=HOALONG
server_name[3]=THOLONG
server_name[4]=MOCLONG
server_name[5]=THUYLONG
server_name[6]=THANHLONG
server_name[7]=CHULONG
server_name[8]=BACHLONG
server_name[9]=VULONG
server_name[10]=THIENLONG
server_name[11]=TRUONGLONG
server_name[12]=LUCLONG
server_name[13]=HUNGLONG
server_name[14]=KIEMLONG
server_name[15]=NHATLONG
server_name[16]=CUONGLONG
server_name[17]=TANGLONG
server_name[18]=TRUCLONG
server_name[19]=PHUCLONG
server_name[20]=NGANLONG
server_name[21]=MINHLONG
server_name[22]=XICHLONG
server_name[23]=LOILONG
server_name[24]=NGOCLONG
server_name[25]=TRUYLONG
server_name[26]=THIETLONG
server_name[27]=HANGLONG
server_name[28]=BALONG
server_name[29]=PHILONG
server_name[30]=MANHLONG
server_name[31]=DAILONG
server_name[32]=VANLONG
server_name[33]=NGUYETLONG
server_name[34]=HACLONG
server_name[35]=SONLONG
server_name[36]=VUONGLONG
server_name[37]=NGAOLONG
server_name[38]=THACHLONG
server_name[39]=PHUNGLONG
server_name[40]=THINHLONG
server_name[41]=TUONGLONG
server_name[42]=HYLONG
server_name[43]=NGULONG
server_name[45]=TRILONG
server_name[47]=CHAULONG
server_name[48]=GIALONG
server_name[49]=KHANGLONG
server_name[50]=QUYENLONG
server_name[51]=DUONGLONG
# for manually
#yesterday=$1
#echo $yesterday

#tdate1=`date +"%Y-%m-%d"`
#tdate2=`date +"%Y%m%d %H:%M:%S"`
tdate1="2012-04-06"
tdate2="20120406 06:00:00"
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
