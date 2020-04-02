filename=`date +"%d%m%Y_%H:%M:%S"` ;
mysqldump --user=ngoalong --password=ekWpqKj3Byg0BqgrESLO -A > /root/backupmysql/$filename.sql
