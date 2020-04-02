<?php
$con=mysql_connect("10.30.27.253","nlvn","ekWpqKj3Byg0BqgrESLO") or die("Connect MYSQL failed ".mysql_error());

mysql_select_db("nlvn_billing");

$sql='select * from pay a where a.ItemName="Gold" and a.BillNo not in ';
$sql.='(select substring(BillNo,1,locate("|",BillNo)-1) from pay where BillNo like "%|%") ';
$sql.="INTO OUTFILE '/tmp/test_billing6.csv' FIELDS TERMINATED BY ',' ";
$sql.=" ESCAPED BY '\\' LINES TERMINATED BY '\n'";

echo $sql;

mysql_query($sql);

?>

ENCLOSED BY ";
$sql.= '"';