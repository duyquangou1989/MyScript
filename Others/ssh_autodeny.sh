#!/bin/bash
# if 3 Failed password then add thos ip's in /etc/host.deny

FAIL_IP_LOG="/tmp/failiplog"
FAIL_IP_LIST="/tmp/failiplist"
CHECK () {
##Neu string dung o vi tri 6 khop voi /Failed/ thi se in ra string o vi tri 11
tail -n20 /var/log/secure | awk '$6 ~ /Failed/ {print $11}' | uniq -c > $FAIL_IP_LOG
##Neu string o vi tri 1  co gia tri lon hon 3 thi se in ra gia tri o vi tri thu 2
awk '($1 > "3") {print $2}' $FAIL_IP_LOG > $FAIL_IP_LIST
}


CHECK

while read IP
do

grep "${IP}" /etc/hosts.deny  >/dev/null 2>&1
STATUS=$?
        if [ "$STATUS" -eq 0 ]; then
        echo "IP: ${IP} already added in hosts.deny"
        else
        echo "IP: ${IP} more than 3 Failed login attempt"
        echo "sshd: ${IP}" >> /etc/hosts.deny
        fi

done < $FAIL_IP_LIST