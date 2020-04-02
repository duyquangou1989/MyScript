	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
        //get date of creating role
        require_once '/home/ngoalong/www/html/config.php';
        //////////////////////////
        $memcache = new Memcache;//set in memcache
        $mbconnect = @$memcache->connect("10.30.27.254","11211");
		
        foreach ($conf_servers_vuigame as $key => $server)
        {
                if ($server['active']==1)
                {
                        $tmp1 = preg_match('/^s(\d+)\./i', $server['ip'], $tmp2);
                        $ip = "10.30.27.{$tmp2[1]}";
                        if(isset($server["realip"]))//use for merged server(1001)
                        {
                                $ip=$server['realip'];
                        }
                        $ch = curl_init("http://$ip:9130/ops/global/allaccounts");
                        curl_setopt($ch, CURLOPT_HEADER, 0);
                        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                        $result = curl_exec($ch) or die(curl_error($ch));
                        if ($result !== false)
                        {
                            $arr=explode("\n",$result);
							foreach($arr as $k => $item)
							{
								$sub_arr=explode(",",$item);
								if($sub_arr!=null)
								{
									var_dump($sub_arr);
									if ($mbconnect)
									{
										$memcache->set($key."_".$sub_arr[2], serialize($sub_arr), false, 86400);
									}
								}
							}
                        }
                }
		}
        exit();
?>