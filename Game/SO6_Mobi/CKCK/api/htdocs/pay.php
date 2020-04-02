<?php
die('dasda');
include_once("../library/function.php");
include_once("../config/config.php");
if(checkIPAllow($arrIPAllowAPI)==true || 1==1)
{
	$args['money'] = $_GET['money'];	
	$args['orderid'] = $_GET['orderId'];
	$serverid 	= strtoupper(trim($_GET["serverId"]));
	$args['username']	= trim($_GET["account"]);
	$args['time']	= $_GET["time"];
	$args['sign']	= $_GET["sign"];
	$sig = md5($args['username'] . $args['money'] . $args['orderid'] . $serverid . $args['time'] . $arrConfigLoginGame["apikeypay"]);
	/*
	if($sig != $args['sign']){
		echo '{"code":-5,"data":null}';
		exit;
	}
	*/
	
	$url = makeRequestpay($args,$serverid);
	//echo $url; exit;
	$logLocation='/data/logs/payment/';
	$logName='payment_'.date('Ymd');
	$result=httpGet($url);
	writeLog($logLocation.$logName,$url."|".$result . "|" . getClientIP()); 
	//$returncode = json_decode($strData)->{'status'};

	echo $result;
}else
{
	echo '{"code":-2,"data":null}';
}
?>
