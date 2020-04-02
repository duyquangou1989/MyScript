<?php
// dungvv@vng.com.vn
require_once 'config.php';
require_once 'global.php';
/*
*   Input:
*       AccountName: String (24)
*       PaymentType: Int (1: Card, 2: SMS, 3: Xu)
*       TransactionID: String (32)
*       CardCode: String (12)
*       PaymentValue: Int
*       //Description: String (32)
*       UserIP: String (20)
*       Time: Int
*       Bonus: Bit
*       Signature: String (32)
*   Output:
*       JSON
*/

// check permission
checkPermission();

// get parameters
$accountName = getAccountName($_GET['acc']);
$paymentType = getPaymentType($_GET['pt']);
$transactionID = getTransactionID($_GET['trans']);
$cardCode = getCardCode($_GET['cc']);
$paymentValue = getPaymentValue($_GET['pv']);
//$description = getDescription($_GET['des']);
$description = "Called from {$_SERVER['REMOTE_ADDR']}";
$userIP = getUserIP($_GET['ip']);
$time = getTime($_GET['time']);
$bonus = getBonus($_GET['bonus']);
$signature = getSignature($_GET['sig']);

// validation
$now = time();
if ($now - $time > 300) {
    writeLogAccess('charg_xu', "$accountName|$userIP|ERROR_API_TIMEOUT");
    responseError(ERROR_API_TIMEOUT, 'Timeout');
}

$sig_check = md5($accountName.$paymentType.$transactionID.$cardCode.$paymentValue.$userIP.$time.$bonus.$config['app']['key']);
if ($sig_check != $signature) {
    writeLogAccess('charg_xu', "$accountName|$userIP|ERROR_INVALID_SIGNATURE");
    responseError(ERROR_INVALID_SIGNATURE, 'Signature is invalid');
}
// execute stored procedure
try {
    $conn = new PDO("dblib:host={$config['db']['host']};dbname={$config['db']['name']}", $config['db']['user'], $config['db']['pass']);
    $stmt = $conn->prepare("EXEC [dbo].[WS_G1PP_ChargeXu] :accountName, :paymentType, :transactionID, :cardCode, :paymentValue, :description, :userIP");
    $stmt->bindValue(':accountName', $accountName, PDO::PARAM_STR);
    $stmt->bindValue(':paymentType', $paymentType, PDO::PARAM_INT);
    $stmt->bindValue(':transactionID', $transactionID, PDO::PARAM_STR);
    $stmt->bindValue(':cardCode', $cardCode, PDO::PARAM_STR);
    $stmt->bindValue(':paymentValue', $paymentValue, PDO::PARAM_INT);
    $stmt->bindValue(':description', $description, PDO::PARAM_STR);
    $stmt->bindValue(':userIP', $userIP, PDO::PARAM_STR);
    if (!$stmt->execute()) {
        $conn = NULL;
        $tmp = implode(';', $stmt->errorInfo());
        writeLogAccess('charg_xu', "$accountName|$userIP|SQL_EXECUTE_ERROR|$tmp");
        responseError(ERROR_INTERNAL, "SQL error: $tmp");
    }
    $result = $stmt->fetchAll();
    $conn = NULL;
    // success    
    if ($result[0]['Result'] == 1) {
        writeLogChargeXu($accountName, $transactionID, $cardCode, $paymentValue, $result[0]['OldBalance'], $bonus);
        responseSuccess($accountName);
    } else if ($result[0]['Result'] == -1) {
        writeLogAccess('charg_xu', "$accountName|$userIP|SQL_RETURN_CODE|Account did not exist");
        responseError(ERROR_ACCOUNT_NOT_EXISTS, 'Account did not exist');
    }  else if ($result[0]['Result'] == -3) {
        writeLogAccess('charg_xu', "$accountName|$userIP|SQL_RETURN_CODE|Card code is duplicated");
        responseError(ERROR_CARD_CODE_DULICATED, "Card code is dulicated");
    } else {
        writeLogAccess('charg_xu', "$accountName|$userIP|SQL_RETURN_ERROR|Internal error");
        responseError(ERROR_INTERNAL, "Internal error");
    }
} catch (PDOException $e) {
    writeLogAccess('charg_xu', "$accountName|$userIP|SQL_RETURN_ERROR|".$e->getMessage());
    responseError(ERROR_INTERNAL, 'SQL error: '.$e->getMessage());
}
?>