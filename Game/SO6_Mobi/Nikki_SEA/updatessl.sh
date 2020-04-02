#!/bin/bash
RESOURCEBIN='/data/qjnn/resource/bin'
LOGINBIN='/data/qjnn/login/bin'
PORTALBIN='/data/qjnn/portal/bin'
NGINX='/data/nginx'
BACKUPPATH='/tmp'

#$1 IP
#$2 path chua cert backup
function backup
{
	ssh root@${1} "cd $2; /bin/tar -zcf /tmp/oldcert.tar.gz *.pem"
}

#$1 File hostlist
#$2 bin path
function updatessl 
{
	echo "Update ${1} ... "
	/bin/sleep 1
	for i in `cat $1`
	do
		echo "Backup ${i} ..."
		backup ${i} ${2}

		/usr/bin/scp *.pem root@${i}:${2}
		ssh root@${i} "cd ${2}; /bin/chown -R nikki01.nikki01 *.pem"
	done
}

updatessl resourcelogin.txt $RESOURCEBIN
updatessl resourcelogin.txt $LOGINBIN
updatessl portal.txt $PORTALBIN
updatessl nginx.txt $NGINX