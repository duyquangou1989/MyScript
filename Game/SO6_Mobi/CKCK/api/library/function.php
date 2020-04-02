<?php

function httpGet($url) 
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_URL, $url);
    $respond = curl_exec($ch);
    curl_close($ch);
    return $respond;
}


function makeRequestpay(array $args,$serverid) {
	global $arrConfigLoginGame;
	global $conf_servers;
	$time = time ();
	$username = $args['username'];
	$money = $args['money'];
	$orderid = $args['orderid'];
	$sid = strtolower($serverid);
	$sig = md5("money=".$money."&orderId=".$orderid."&serverId=".$serverid."&time=".$time."&username=".$username."&key=".$arrConfigLoginGame["keypay"]);
	$linkpay = $conf_servers["$sid"]["ip"].'/'.$arrConfigLoginGame["pay"]."?username=".urlencode($username)."&serverId=".$serverid."&money=".$money."&orderId=".$orderid."&sign=".$sig."&time=".$time ;
	return $linkpay;
}
function makeRequestcheckacc(array $args,$serverid) {
	global $arrConfigLoginGame;
	global $conf_servers;
	$time = time ();
	$username = $args['username'];
	$sid = strtolower($serverid);
	$sig = md5("time=".$time."&username=".$username."&key=".$arrConfigLoginGame["keylogin"]); 
	$linkcheck = $conf_servers["$sid"]["ip"].'/'.$arrConfigLoginGame["getinfo"]."?username=".urlencode($username)."&time=".$time."&serverId=".$serverid."&sign=".$sig ;
	
	return $linkcheck;
}

function sortArray($p_value,$p_array,$p_tsort=SORT_DESC)
{
	$arrTmp = array();
	foreach ($p_array as $key => $row)
	{
		$arrTmp[$key] = $row[$p_value];
	}
	array_multisort($arrTmp, $p_tsort, $p_array);
	return $p_array;
}

function getClientIP_old()
{ 
	if (isset ($_SERVER ['HTTP_X_FORWARDED_FOR']))
	{
		$clientIP = $_SERVER ['HTTP_X_FORWARDED_FOR'];
	}
	elseif (isset ($_SERVER ['HTTP_X_REAL_IP']))
	{
		$clientIP = $_SERVER ['HTTP_X_REAL_IP'];
	}
	else
	{
		$clientIP = $_SERVER['REMOTE_ADDR'];
	}
	return $clientIP;
}

function getClientIP()
{ 
	if (isset ($_SERVER['REMOTE_ADDR']))
	{
		$clientIP = $_SERVER['REMOTE_ADDR'];
	}else
	{
		$clientIP = $_SERVER['REMOTE_ADDR'];
	}
	return $clientIP;
}

function checkIPAllow($p_arrIPAllow)
{ 
	$clientIP = getClientIP();
	if(in_array($clientIP,$p_arrIPAllow))
		return true;
	else
		return false;
}

function writeLog($dest,$content)
{
        $fullURL = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $handle = fopen($dest,'a+');
        fwrite($handle,date('Y-m-d H:i:s')."|".$fullURL."|".$content."\n");
        fclose($handle);
}
?>
