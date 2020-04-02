<?php
   #chucvv@vng.com.vn
   include('/home/ngoalong/www/html/config.php');
   $path_log="/bkfarm/log/character_bk/";
   $check=mkdir($path_log.date("Y.m.d"),0777);
   # $check=mkdir($path_log.'2012.09.09',0777);
   $path_log=$path_log.date("Y.m.d");
   # $path_log=$path_log.'2012.09.09';
  if($check)
  {
		$flag=0;	
	   foreach ($conf_servers as $key => $server) 
	   {
			if ($server['active']==1) 
				{
					$tmp1 = preg_match('/^s(\d+)\./i', $server['ip'], $tmp2);
					$ip = "10.30.27.{$tmp2[1]}";
					$namefile=$server["id"]."_".strtoupper($key);
					if($server['id']==1001)
						{
							if($flag==0)
							{
								$ip="10.30.27.23";
								$namefile="1001_PHUCLONG-NGOCLONG";
								$flag++;
							}
						}
					if($ip!="")
					{
						$ch = curl_init("http://$ip:9130/ops/global/accounts");
						curl_setopt($ch, CURLOPT_HEADER, 0);
						curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
						$result = curl_exec($ch); 
						curl_close($ch);
						if($result!==false)
						{
							 $file_handler=fopen($path_log."/".$namefile,"a+");
							 fwrite($file_handler,$result);
							 fclose($file_handler);
						}
					}      
				}
		}
		//for server on vuigame
	   foreach ($conf_servers_vuigame as $key => $server)
	   {
			if ($server['active']==1)
				{
					$tmp1 = preg_match('/^s(\d+)\./i', $server['ip'], $tmp2);
					$ip = "10.30.27.{$tmp2[1]}";
					$namefile=$server["id"]."_".strtoupper($key);
					if($ip!="")
					{
							$ch = curl_init("http://$ip:9130/ops/global/accounts");
							curl_setopt($ch, CURLOPT_HEADER, 0);
							curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
							$result = curl_exec($ch);
							curl_close($ch);
							if($result!==false)
							{
								 $file_handler=fopen($path_log."/".$namefile,"a+");
								 fwrite($file_handler,$result);
								 fclose($file_handler);
							}
					}
				}
		}
		//for server on yahoo
	   foreach ($conf_servers_yahoo as $key => $server)
	   {
			if ($server['active']==1)
				{
					$tmp1 = preg_match('/^s(\d+)\./i', $server['ip'], $tmp2);
					$ip = "10.30.27.{$tmp2[1]}";
					$namefile=$server["id"]."_".strtoupper($server['filelog']);
					if($ip!="")
					{
							$ch = curl_init("http://$ip:9130/ops/global/accounts");
							curl_setopt($ch, CURLOPT_HEADER, 0);
							curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
							$result = curl_exec($ch);
							curl_close($ch);
							if($result!==false)
							{
								 $file_handler=fopen($path_log."/".$namefile,"a+");
								 fwrite($file_handler,$result);
								 fclose($file_handler);
							}
					}
				}
		}
		//for server on zingplay
	   foreach ($conf_servers_zingplay as $key => $server)
	   {
			if ($server['active']==1)
				{
					$tmp1 = preg_match('/^s(\d+)\./i', $server['ip'], $tmp2);
					$ip = "10.30.27.{$tmp2[1]}";
					$namefile=$server["id"]."_".strtoupper($key);
					if($ip!="")
					{
							$ch = curl_init("http://$ip:9130/ops/global/accounts");
							curl_setopt($ch, CURLOPT_HEADER, 0);
							curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
							$result = curl_exec($ch);
							curl_close($ch);
							if($result!==false)
							{
								 $file_handler=fopen($path_log."/".$namefile,"a+");
								 fwrite($file_handler,$result);
								 fclose($file_handler);
							}
					}
				}
		}
  }
  else
  {
  }
?>

