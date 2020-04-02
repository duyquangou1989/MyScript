mysqldump -u dev -p@@@dev@@@@@ -h 10.0.0.100 --routines --lock-tables=false  --no-create-info  --add-drop-table  --no-data --no-create-db TMKT > /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.101  TMKT < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.102  TMKT < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.103  TMKT < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.104  TMKT < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.105  TMKT < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.106  TMKT < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.107  TMKT < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.108  TMKT < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.66   TMKT  < /home/sql/TMKT_store_`date +%G%m%d`.sql
mysql -u dev -p@@@dev@@@@@ -h 10.0.0.68   TMKT  < /home/sql/TMKT_store_`date +%G%m%d`.sql
