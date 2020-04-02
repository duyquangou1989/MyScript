<?php
// dungvv@vng.com.vn
require_once 'config.php';
$GLOBALS['THRIFT_ROOT'] = './scribe';
require_once $GLOBALS['THRIFT_ROOT'].'/scribe.php';
require_once $GLOBALS['THRIFT_ROOT'].'/transport/TSocket.php';
require_once $GLOBALS['THRIFT_ROOT'].'/transport/TFramedTransport.php';
require_once $GLOBALS['THRIFT_ROOT'].'/protocol/TBinaryProtocol.php';


function writeLogChargeXu($acc, $trans, $cc, $xu, $oldbalance, $bonus) {
    global $config;
    // format: acc,transaction,cardcode,xu,oldbalance,bonus,datetime
    $message = sprintf("%s,%s,%s,%d,%d,%d,%s", $acc, $trans, $cc, $xu, $oldbalance, $bonus, date('Y-m-d H:i:s'));
    $socket = new TSocket($config['log']['host'], $config['log']['port']);
    $transport = new TFramedTransport($socket);
    $protocol = new TBinaryProtocol($transport, false, false);
    $scribe_client = new scribeClient($protocol, $protocol);
    $transport->open();    
    $data = array(new LogEntry(array('category'=>'payment', 'message'=>$message)));    
    $scribe_client->Log($data);
    $transport->close();
    $socket->close();
}

function writeLogAccess($function, $msg) {
    global $config, $_SERVER;
    // format: datetime,ip,function,msg
    $message = sprintf("%s,%s,%s,%s", date('Y-m-d H:i:s'), $_SERVER['REMOTE_ADDR'], $function, $msg);
    $socket = new TSocket($config['log']['host'], $config['log']['port']);
    $transport = new TFramedTransport($socket);
    $protocol = new TBinaryProtocol($transport, false, false);
    $scribe_client = new scribeClient($protocol, $protocol);
    $transport->open();    
    $data = array(new LogEntry(array('category'=>'access', 'message'=>$message)));    
    $scribe_client->Log($data);
    $transport->close();
    $socket->close();
}

function checkPermission() {
    global $config;
    if (!in_array($_SERVER['REMOTE_ADDR'], $config['app']['allowed_ips'])) {
        responseError(ERROR_DENIED, 'Denied');
    }
}

function getResponseObject($error, $msg) {
    $obj = new StdClass();
    $obj->error = $error;
    $obj->data = $msg;
    return $obj;
}

// return error to client
function responseError($error, $msg) {
    $obj = getResponseObject($error, $msg);
    echo json_encode($obj);    
    exit;
}

function responseSuccess($msg) {
    $obj = getResponseObject(ERROR_NONE, $msg);
    echo json_encode($obj);
    exit;
}

function getBonus($b) {
    if (preg_match('/^[0,1]$/i', $b, $match))
        return $match[0];
    responseError(ERROR_INVALID_PARAMETER, 'Bonus is invalid');
}

// account: string(31)
function getAccountName($account) {
    $account = strtolower(trim($account));
    if (preg_match('/^\w{3,31}$/i', $account, $match)) {
        return $match[0];
    }
    responseError(ERROR_INVALID_PARAMETER, 'Account name is invalid');
}

// for API charge xu
function getPaymentType($type) {
    $type = intval($type);
    if ($type < 1 OR $type > 3)
        responseError(ERROR_INVALID_PARAMETER, 'Payment type is invalid');
    return $type;
}

// id: varchar(32)
function getTransactionID($id) {
    $id = trim($id);
    if (preg_match('/^\w{2,32}$/i', $id, $match)) {
        return $match[0];
    }
    responseError(ERROR_INVALID_PARAMETER, 'Transaction id is invalid');
}

// code: string(12)
function getCardCode($code) {
    $code = trim($code);
    if (preg_match('/^\w{2,32}$/i', $code, $match)) {    
        return $match[0];
    }
    responseError(ERROR_INVALID_PARAMETER, 'Card code is invalid');
}

function getPaymentValue($value) {
    // khong tu dong chuyen kieu int
    // $value = intval($value)
    if (preg_match('/^\d+$/i', $value, $match)) {        
        $match[0] = intval($match[0]);
        if ($match[0] > 0)
            return $match[0];
    }
    responseError(ERROR_INVALID_PARAMETER, 'Payment value is invalid');
}

function getUserIP($ip) {
    if (preg_match('/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/i', $ip, $match)) {
        return $match[0];
    }
    responseError(ERROR_INVALID_PARAMETER, 'User IP is invalid');
}

function getTime($time) {
    $time = intval($time);
    if ($time == 0) responseError(ERROR_INVALID_PARAMETER, 'Time is invalid');
    return $time;
}

function getSignature($sig) {
    $sig = trim($sig);
    if (preg_match('/^\w{32}$/i', $sig, $match)) {
        return $match[0];
    }
    responseError(ERROR_INVALID_PARAMETER, 'Signature is invalid');
}
?>