<?php 

include_once("../config/config_game.php");
include_once("../config/config_list_server.php");

$oldtime	= time() - 299;
$time		= time();

$host	= $arrConfigLoginGame["host"];
$user	= $arrConfigLoginGame["userdb"];
$pass	= $arrConfigLoginGame["password"];
$dbname	= $arrConfigLoginGame["dbname"];

	try {
		$conn = new PDO("mysql:host=$host;dbname=$dbname;unix_socket=/tmp/mysql1.sock", $user, $pass);
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sql = "SELECT * FROM ccu WHERE time > $oldtime AND time <=$time";
		
		$stmt = $conn->prepare($sql); 
		$stmt->execute();
		$result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
		$arrData = $stmt->fetchAll();
		
	}catch(PDOException $e){
		echo $e->getMessage();
	}
	$conn = null;

$arrResult["unixtime"]=$time;
$arrResult["groupid"]="";
$arrResult["group_name"]="";

foreach($arrData as $key=>$server){
	$ID=strtolower($server["serverid"]);
	$arrCCU[$key]["serverid"] = $ID;
	$arrCCU[$key]["server_name"] = $conf_servers[$ID]["name"];
	
	$status=$conf_servers[$ID]["status"];
	if($status==1)
			$status=0;
	else
		$status=1;
	$arrCCU[$key]["status"]=$status;
	$arrCCU[$key]["ccu"]=$server["ccu"];
}	

$arrResult["server_list"]=$arrCCU;

echo json_encode($arrResult);
	
?>
