<?php
// dungvv@vng.com.vn
//error_reporting(E_ALL & ~E_NOTICE);
error_reporting(0);

$config['db']['host'] = 'jxfree'; // name in configuration of freetds
$config['db']['user'] = 'ws_payment';
$config['db']['pass'] = '$jxf@898n%VNG!oer#nw68';
$config['db']['name'] = 'NEWACCOUNT';

$config['log']['host'] = 'localhost'; // scribe service
$config['log']['port'] = '1463';

$config['app']['key'] = '45cb40258b4a775d7a0ab44e3e6ad982';

$config['app']['allowed_ips'] = array('10.30.8.206');

define('ERROR_NONE', 0);
define('ERROR_API_TIMEOUT', 1);
define('ERROR_INTERNAL', 2);
define('ERROR_DENIED', 3);
define('ERROR_INVALID_PARAMETER', 11);
define('ERROR_INVALID_SIGNATURE', 12);
define('ERROR_ACCOUNT_NOT_EXISTS', 21);
define('ERROR_CARD_CODE_DULICATED', 22);