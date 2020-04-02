<?php

$user = "";

$password = "";

$data = "productDomain=cdn_new.bietdoi69.com&paths=/Update/ios/generalgain.html";

$header = array(

    'Content-Type: application/x-www-form-urlencoded',

    'Authorization: Basic '. base64_encode("$user:$password")

);



$url_send ="http://api.vcdn.vn/ird-restful-services/cdn/purge-cache/";

$str_data = json_encode($data);



function sendPostData($url, $post, $header){

  $ch = curl_init($url);

  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");  

  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

  curl_setopt($ch, CURLOPT_POSTFIELDS,$post);

  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); 

  curl_setopt($ch, CURLOPT_HTTPHEADER, $header);

  $result = curl_exec($ch);

  curl_close($ch);  

  return $result;

}





$result = sendPostData($url_send, $data, $header);

if ($result == "true") {

	echo "true";

}

else {

	echo "failed";

}


// curl -XPOST 'http://api.vcdn.vn/ird-restful-services/cdn/purge-cache' -u 'nikkien_api:HD2G3caTZwNTa1nNtHYK' -d 'productDomain=nikkien.static.g6.zing.vn&paths=/test2.txt'  -H 'accept: application/json'
//curl -v -XPOST 'http://api.vcdn.vn/ird-restful-services/cdn/purge-cache' -u 'nikcnpg2_api:B8PKccpLay8V7dg' -d 'productDomain=static-nikkicn.mto.zing.vn&paths=/my.cnf'  -H 'accept: application/json'
?>
