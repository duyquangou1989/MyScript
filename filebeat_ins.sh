#!/bin/bash
#CentOS7 
FILEBEATCONF='/etc/filebeat'
YUMREPO='/etc/yum.repos.d'
DOWNLOADURL='http://10.30.10.11/download'
FILEBEATDATA=('elastic.repo' 'filebeat.yml')

function Requirement {
	yum -y install tcpdump rsyslog nc sysstat net-tools wget
	nc -zv 10.30.10.11 80 > /dev/null 2>&1
	if [ $? -ne 0 ];then
		echo -e "[X]\tCan not connect download url"
		return 21
	else
		echo -e "[V]\tConnect to Download Source Success"
	fi
	sleep 2
	nc -zv 10.30.80.2 5044 > /dev/null 2>&1
	if [ $? -ne 0 ];then
                echo -e "[X]\tConnect Logstash Failed"
                return 21
        else
                echo -e "[V]\tConnect Logstash Success"
        fi
	mkdir -p /tmp/filebeatsource
	rm -rfv /tmp/filebeatsource/*
	cd /tmp/filebeatsource
	for file in ${FILEBEATDATA[*]}
	do
		wget $DOWNLOADURL/$file
		if [ $? -ne 0 ]; then
			echo -e "[X]\tMissing file needed ..."
			return 21
		fi
	done
}
function Install 
{
	for file in ${FILEBEATDATA[*]};do
		if [ $file == "elastic.repo" ];then
                       cp -rfv $file ${YUMREPO}
                       yum clean all
                       yum install filebeat -y
                else if [ $file == "filebeat.yml" ];then
                       cp -rfv $file ${FILEBEATCONF}
                       systemctl enable --now filebeat
                       fi
               fi
	done
}
function Cleanup
{
	if [ -d /tmp/filebeatsource ];then
		rm -rfv /tmp/filebeatsource
	fi
}

function Quat 
{
	Requirement
	if [ $? -ne 0 ]; then
		exit 35
	fi
	Install
	Cleanup
	echo -e "[V]\tDone"
}

Quat
