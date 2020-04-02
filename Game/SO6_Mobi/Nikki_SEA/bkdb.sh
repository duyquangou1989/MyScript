#!/bin/bash
#Owner by Tungvt - MTO
#Script backup used Percona Xtrabackup

#### Variable time & date ####
        pIp=`/sbin/ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '1.1.1.1' | cut -d: -f2 | awk '{print $1}' | grep -v *.201`
        pDate=`date +%F`
        pHour=`date +%H%M`
        pDir="/home/backup/db"
#### Create folder backup ####
        pStored=$pDir/$pDate/$pIp
        if [ ! -d "$pStored" ]
        then mkdir -p "$pStored"
        fi
#### Basic config ####
        pUser="bkper"
        pPas="IIEKfkkenfe#29"
        pThreads=$(expr `sudo cat /proc/cpuinfo | grep processor | wc -l` / 2)
        pConfig="--no-timestamp --compress --compress-threads=$pThreads"
        pComp="--stream=xbstream"
        pLog="/home/backup/db/logs/nik_bk_full_$pDate.log"
        pFile="NIK_BK_FULL_XTRA_$pDate_$pHour.tar.gz"
#### Create log backup file ####
        pLog="/home/backup/db/logs/nik_bk_full_$pDate.log"
        if [ ! -e "$pLog" ]
        then mkdir -p "/home/backup/db/logs" && touch "$pLog"
        fi
#### Backup Processing - Do not change anything below ####
        cd $pStored
	/usr/bin/innobackupex --user=$pUser --password=$pPas $pConfig $pComp $pStored > $pStored/$pFile
#### Push backup to stored ####
	cd $pDir
	rsync -avzh ./ rsync://10.30.68.35/nikki_db/ >> $pLog 2>&1
#### Remove Old Log ####
	pOld=`date -d "3 day ago" +"%Y-%m-%d"`
	rm -rf ${pOld} >> $pLog 2>&1