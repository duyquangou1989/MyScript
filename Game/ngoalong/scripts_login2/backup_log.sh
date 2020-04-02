#!/bin/bash
# dungvv@vng.com.vn

userid=1024
groupid=1024
source_log=/home/ngoalonglog/data
destination_log=/bkfarm/log
dest_original_log=/bkfarm/original_log
audit_log=/bkfarm/AUDIT
yesterday=$(date --date="yesterday" +"%Y-%m-%d")
#yesterday=2013-04-13

server_key=( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 1001 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 45 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 
62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 2001 91 92 93 94 95 96 4001 )
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
server_ip[1001]=118.102.7.23
server_ip[20]=118.102.7.24
server_ip[21]=118.102.7.25
server_ip[22]=118.102.7.26
server_ip[23]=118.102.7.27
#server_ip[24]=118.102.7.28
server_ip[25]=118.102.7.29
server_ip[26]=120.138.77.226
server_ip[27]=118.102.7.31
server_ip[28]=120.138.77.227
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
#server_ip[50]=118.102.7.54
#server_ip[51]=118.102.7.55
#server_ip[52]=118.102.7.28
#server_ip[53]=118.102.7.56
server_ip[50]=120.138.77.246
server_ip[51]=120.138.77.247
server_ip[52]=120.138.77.248
server_ip[53]=120.138.77.249
server_ip[54]=49.213.66.197
server_ip[55]=49.213.66.198
server_ip[56]=49.213.66.199
server_ip[57]=49.213.66.200
server_ip[58]=118.102.7.47
server_ip[59]=49.213.66.195
server_ip[60]=49.213.66.196
server_ip[61]=118.102.7.57
#server_ip[62]=49.213.66.201
#server_ip[63]=49.213.66.202
#server_ip[64]=49.213.66.203
#server_ip[65]=49.213.66.204
server_ip[62]=49.213.72.213
server_ip[63]=49.213.72.214
server_ip[64]=49.213.72.215
server_ip[65]=49.213.72.216
server_ip[66]=49.213.66.205
server_ip[67]=49.213.66.209
server_ip[68]=49.213.66.210
server_ip[69]=49.213.66.211
server_ip[70]=49.213.66.212
#server_ip[71]=49.213.66.213
#server_ip[72]=49.213.66.214
#server_ip[73]=49.213.66.215
#server_ip[74]=49.213.66.216
server_ip[71]=120.138.77.240
server_ip[72]=120.138.77.241
server_ip[73]=120.138.77.242
server_ip[74]=120.138.77.243
server_ip[75]=120.138.77.228
server_ip[76]=120.138.77.229
server_ip[77]=120.138.77.230
server_ip[78]=120.138.77.231
server_ip[79]=120.138.77.232
server_ip[80]=120.138.77.233
server_ip[81]=120.138.77.234
server_ip[82]=120.138.77.235
server_ip[83]=120.138.77.236
server_ip[84]=120.138.77.237
server_ip[85]=120.138.77.238
server_ip[86]=120.138.77.239
server_ip[87]=120.138.77.244
server_ip[88]=120.138.77.245
server_ip[89]=120.138.77.250
server_ip[90]=120.138.77.251
server_ip[2001]=120.138.77.253
server_ip[91]=120.138.77.252
server_ip[92]=49.213.72.194
server_ip[93]=49.213.72.195
server_ip[94]=49.213.72.196
server_ip[95]=49.213.72.197
server_ip[96]=49.213.72.198
server_ip[4001]=49.213.72.205
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
server_name[1001]=PHUCLONG-NGOCLONG
server_name[20]=NGANLONG
server_name[21]=MINHLONG
server_name[22]=XICHLONG
server_name[23]=LOILONG
#server_name[24]=ANLONG
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
server_name[52]=ANLONG
server_name[53]=BANGLONG
server_name[54]=YLONG
server_name[55]=CHINHLONG
server_name[56]=DANHLONG
server_name[57]=GIAPLONG
server_name[58]=HOANGLONG
server_name[59]=TANLONG
server_name[60]=KHAILONG
server_name[61]=UYLONG
server_name[62]=TUANLONG
server_name[63]=NAMLONG
server_name[64]=QUYLONG
server_name[65]=PHATLONG
server_name[66]=SONGLONG
server_name[67]=BINHLONG
server_name[68]=XICHBICH
server_name[69]=TIENLONG
server_name[70]=DINHLONG
server_name[71]=LUCLONG
server_name[72]=NHANLONG
server_name[73]=THANGLONG
server_name[74]=VILONG
server_name[75]=XICHLONG
server_name[76]=DULONG
server_name[77]=KIEULONG
server_name[78]=BAOLONG
server_name[79]=CHANLONG
server_name[80]=DIEMLONG
server_name[81]=HUYLONG
server_name[82]=KHOILONG
server_name[83]=HAOLONG
server_name[84]=GIANGLONG
server_name[85]=THANLONG
server_name[86]=LINHLONG
server_name[87]=ANHLONG
server_name[88]=BOILONG
server_name[89]=BICHLONG
server_name[90]=CHUANLONG
server_name[2001]=LUUBI
server_name[91]=DUNGLONG
server_name[92]=DIENLONG
server_name[93]=GIAOLONG
server_name[94]=HOLONG
server_name[95]=KHANHLONG
server_name[96]=LELONG
server_name[4001]=DIEUTHUYEN
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
