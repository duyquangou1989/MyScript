<?php
//echo $_SERVER["REQUEST_URI"];
//echo $_SERVER["SERVER_NAME"];
$time=round(microtime(true)*10000);
$handle = fopen("/home/php/queue/$time.queue","a+")
fwrite($handle,"http://".$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"]);
fclose($handle);
