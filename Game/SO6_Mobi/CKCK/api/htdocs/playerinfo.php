<?php
die('dsfs');
include_once("../library/function.php");
include_once("../config/config.php");
if(checkIPAllow($arrIPAllowAPI)==true || 1==1)
{
	$serverid 	= strtoupper(trim($_GET["serverId"]));
	$args['username']	= trim($_GET["account"]);
	$args['time']	= $_GET["time"];
	$args['sign']	= $_GET["sign"];
	$sig = md5($args['username'] . $serverid . $args['time'] . $arrConfigLoginGame["apikeyinfo"]);
	
	if($sig != $args['sign']){
		echo '{"code":-5,"data":null}';
		exit;
	}
	
	$url = makeRequestcheckacc($args,$serverid);
	
	$logLocation='/data/logs/payment/';
	$logName='player_'.date('Ymd');
	$strData = httpGet($url);
	writeLog($logLocation.$logName,$url."|".$strData . "|" . getClientIP() . "|" . $_SERVER['REMOTE_ADDR']); 
	echo $strData;
}
else
{
	echo '{"code":-2,"data":null}';
}
?>