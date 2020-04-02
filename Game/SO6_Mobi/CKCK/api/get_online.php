<?php
include_once("/data/webdata/api/config/config_list_server.php");
include_once("/data/webdata/api/library/function.php");
include_once("/data/webdata/api/config/config_game.php");


$time	= time();
$key 	= $arrConfigLoginGame["key"];
$sign	= md5("time=".$time."&key=".$key);
$host	= $arrConfigLoginGame["host"];
$user	= $arrConfigLoginGame["userdb"];
$pass	= $arrConfigLoginGame["password"];
$dbname	= $arrConfigLoginGame["dbname"];

foreach($conf_servers as $server){
	if($server["opendateunix"] <= time())
	{
		$url = $server["url"].'/'.$arrConfigLoginGame["getccu"].'?time='.$time.'&sign='.$sign.'&serverId='.$server["id"];
		$strData = httpGet($url);
		$strData = json_decode($strData);
		if($strData->code==1)
			$ccu=$strData->data->online;
		else
			$ccu = 0;
		
		try {
			$conn = new PDO("mysql:host=$host;dbname=$dbname;unix_socket=/tmp/mysql1.sock", $user, $pass);
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "INSERT INTO ccu (serverid, ccu, time) VALUES ('".$server["id"]."', ".$ccu.", '".$time."')";
			$conn->exec($sql);
			echo "New record created successfully";
		}catch(PDOException $e){
			echo $e->getMessage();
		}

		$conn = null;
	}
}


?>
