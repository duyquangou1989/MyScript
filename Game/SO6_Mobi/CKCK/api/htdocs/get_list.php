<?php

	$public_key     ='5999a442fec8dfr77a0209ccc4dg5a9c';
	
	
   if ( $_GET['production'] == 'dck360' ) {
	 require_once('/usr/local/nginx/html/360game/config/config_list_server.php');
   }
   
   else if ($_GET['phucph2']=='test') 
	{
		$now=time();	
    $sig=md5('dck360'.$now.$public_key); 
    echo "/get_list.php?production=dck360&time={$now}&sig={$sig}"; 
    exit;
	}
   else {
		echo "wrong production name,please contact phucph2@vng.com.vn";
		exit;
   }
   class cserver
   {
	  public $key;
	  public $server_id;
	  public $server_name;
	  #public $zone;
	  public $domain;
	  public $isnew;
	  public $ishot;
	  public $open_date;
	  public function __construct($key,$id,$name,$zone,$ip,$isnew,$ishot,$open_dt)
	  {
		 $this->key=$key;
		 $this->server_id=$id;
		 $this->server_name=$name;
		 #$this->zone=$zone;
		 $this->domain=$ip;
		 $this->isnew=$isnew;
		 $this->ishot=$ishot;
		 $this->open_date=$open_dt;
	  }
   }
   $servers=array();
   $i=0;
   foreach($conf_servers as $key => $server)
   {
		if($server['active']==1)
		{
			if (isset ($server['api']) && $server['api']==0 )
			{
				continue;
			}
			$servers[$i++]=new cserver($key,$server['id'],$server['name'],$server['zone'],$server['ip'],$server['new'],$server['hot'],$server['open_dt']);
		}
   }


	$production	=$_GET['production'];
	$time		=$_GET['time'];
	$sig		=$_GET['sig'];
	$auth		=md5($production.$time.$public_key);
	if($sig != $auth)
	{
		$arrData["code"] = -1;
		$arrData["message"] = "sign error!!!";
		$arrData["data"] = array();
		echo json_encode($arrData);
		exit();  //-1 wrong key
	} 
	
	$arrData["code"] = 1;
	$arrData["message"] = "success";
	$arrData["data"] = $servers;
	
	$result = json_encode($arrData);
	
	echo $result;
	
	
?>
