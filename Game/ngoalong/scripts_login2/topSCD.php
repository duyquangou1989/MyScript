
<?php
	function objectToArray($d) 
	{
		if (is_object($d)) 
		{
			$d = get_object_vars($d);
		}
		if (is_array($d)) 
		{
			return array_map(__FUNCTION__, $d);
		}
		else 
		{
			return $d;
		}
	}
	//get top on each server
	require_once '/home/ngoalong/www/html/config.php';
	//////////////////////////
	$flag=0;
	$arr_scd=array();
	foreach ($conf_servers as $key => $server) 
	{
		if ($server['active']==1) 
		{
			$tmp1 = preg_match('/^s(\d+)\./i', $server['ip'], $tmp2);
			$ip = "10.30.27.{$tmp2[1]}";
			if(isset($server["realip"]))//use for merged server(1001)
			{
				$ip=$server['realip'];
			}
			$ch = curl_init("http://$ip:9130/ops/global/rank_log?type=2&count=1");
			curl_setopt($ch, CURLOPT_HEADER, 0);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			$result = curl_exec($ch) or die(curl_error($ch));
			if ($result !== false) 
			{
				$result = json_decode($result);
				$arr_temp=objectToArray($result);
				foreach ($arr_temp as $k => $element)
				{
					$country="";
					if($element['country']=='1')
					{
						$country="Thục";
					}
					else if($element['country']=='2')
					{
						$country="Ngô";
					}
					else
					{
						$country="Ngụy";
					}
					$arr_scd[$key]=array($element['accid'],$country,$element['name'],$element['value']);
				}
			}
		}
    }	
	
	$memcache = new Memcache;//set in memcache
	$mbconnect = @$memcache->connect("10.30.27.254","11211");
	if ($mbconnect) 
	{
		foreach($arr_scd as $key => $arr)
		{
			$memcache->set($key, serialize($arr), false, 172800);
		}
	}
	exit();
?>
