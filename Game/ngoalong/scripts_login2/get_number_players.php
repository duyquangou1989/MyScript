<?php
#dungvv@vng.com.vn
require_once '/home/ngoalong/www/html/config.php';

$data = array();
foreach ($conf_servers as $key => $server) {
    if ($server['active']==1) {
        $tmp1 = preg_match('/^s(\d+)\./i', $server['ip'], $tmp2);
        $ip = "10.30.27.{$tmp2[1]}";        
        $ch = curl_init("http://$ip:9130/PlayerNum/");
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        if ($result !== false) {
            $result = json_decode($result);            
            if ($result != "") {                
                $data[$key] = $result->online_num;
            }
        }
    }
}

$memcache = new Memcache;
$mbconnect = @$memcache->connect($conf_memcache[0], $conf_memcache[1]);
$memcache->set('nlvn_number_players', serialize($data), false, 0);
