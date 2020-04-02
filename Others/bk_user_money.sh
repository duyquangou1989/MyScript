#!/bin/bash
DATE=`date +%Y%m%d`
DATERM=`date -d'30 day ago' +%Y%m%d`
LOGPATH=/root/scripts
BKPATH=/backup/gamedata
ip='127.0.0.1'
U='root'
P='baontp@@@!!!'
DB='poker_usermoney_db'
PORT=3306

/bin/mkdir -p $BKPATH/$DATE

/usr/bin/mysqldump --single-transaction -u $U -p$P -h $ip -P$PORT $DB > $BKPATH/$DATE/${DB}.sql
[ $? -eq 0 ] && echo -e "[SUCC]\t$DATE Database $DB" || echo -e "[FAIL]\t$DATE Database $DB"
/bin/gzip $BKPATH/$DATE/${DB}.sql