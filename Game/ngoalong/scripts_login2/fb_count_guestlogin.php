<?php
//chucvv@vng.com.vn
include_once '/home/ngoalong/www/html/config.php';

$yesterday = date('Y-m-d', time()-86400);
$yesterday_format= date('Ymd', time()-86400);
#$yesterday  ='2012-07-06';
#$yesterday_format="20120706";
$log_path = '/bkfarm/log';
$destinate_path="/home/ngoalong/www/data/temp/facebook";
$arr_count=array("65535_{$yesterday_format}_0000.log",
		 "65535_{$yesterday_format}_0200.log",
		"65535_{$yesterday_format}_0400.log",
		"65535_{$yesterday_format}_0600.log",
		"65535_{$yesterday_format}_0800.log",
		"65535_{$yesterday_format}_1000.log",
		"65535_{$yesterday_format}_1200.log",
		"65535_{$yesterday_format}_1400.log",
		"65535_{$yesterday_format}_1600.log",
		"65535_{$yesterday_format}_1800.log",
		"65535_{$yesterday_format}_2000.log",
		"65535_{$yesterday_format}_2200.log",
		);

foreach ($conf_servers as $key => $server) 
	{
	    $key = strtoupper($key);
    		if ($server['active']==1 && in_array(strtolower($key),$conf_allow_serverfacebook)) 
		{
			foreach($arr_count as $filename)
			{
				$path="$log_path/$yesterday/{$server['id']}_$key/$yesterday/$filename";
				exec("cat $path  |grep CreateRole | awk '/fb_.*@/' >> $destinate_path/{$yesterday}_{$key}");
				
			}
    		}
	}
 exec("scp -i /root/.ssh/key_scp /home/ngoalong/www/data/temp/facebook/{$yesterday}_* root@10.30.27.253:/home/ngoalong/www/data/temp/facebook");
?>
