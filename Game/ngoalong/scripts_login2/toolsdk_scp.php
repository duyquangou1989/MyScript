<?php
	exec("scp -i /root/.ssh/key_scp /home/ngoalong/www/data/newserver/temp_history/* root@10.30.27.253:/home/ngoalong/www/data/newserver/temp_history/");
	exec("scp -i /root/.ssh/key_scp /home/ngoalong/www/data/baotri/temp_history/*    root@10.30.27.253:/home/ngoalong/www/data/baotri/temp_history/");
?>
