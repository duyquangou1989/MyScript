<?php
# dungvv@vng.com.vn
include_once '/home/ngoalong/www/html/config.php';

$mail_from  = "alert@idngoalong.zing.vn";
$mail_to    = "thaitd@vng.com.vn";
$mail_cc    = "dungvv@vng.com.vn, chucvv@vng.com.vn ,haolc@vng.com.vn,trangdt3@vng.com.vn";

$message = array();
$today = date('Y-m-d H:i:s');
$yesterday = date('Y.m.d', time()-86400);
$format_day=date('Ymd',time()-86400);
$log_path = '/bkfarm/log/character_bk';

foreach ($conf_servers as $key => $server) 
{
    #check for merged server
    if($server['id']==1001)
     {
	$key="phuclong-ngoclong";
     }
    $key = strtoupper($key);
    if ($server['active']==1)
	{
	
        if (!file_exists("$log_path/$yesterday/{$server['id']}_$key")) 
		{
            $message[] = "Directory $log_path/$yesterday/{$server['id']}_$key didn't exist ({$server['ip']}) \n";
        } 
		else 
		{
			if(filesize( "$log_path/$yesterday/{$server['id']}_$key") < 10)
			{
				 $message[] = "$log_path/$yesterday/{$server['id']}_$key is empty \n";
			}
		}
	}
}
foreach ($conf_servers_vuigame as $key => $server) 
{
    $key = strtoupper($key);
	 if ($server['active']==1) 
	 {
		
			if (!file_exists("$log_path/$yesterday/{$server['id']}_$key")) 
			{
				$message[] = "Directory $log_path/$yesterday/{$server['id']}_$key didn't exist ({$server['ip']}) \n";
			} 
			else 
			{
				if(filesize( "$log_path/$yesterday/{$server['id']}_$key") < 10)
				{
					 $message[] = "$log_path/$yesterday/{$server['id']}_$key is empty \n";
				}
			}
	}
}
foreach ($conf_servers_yahoo as $key => $server) 
{
    $key = strtoupper($server['filelog']);
	 if ($server['active']==1) 
	 {
		
			if (!file_exists("$log_path/$yesterday/{$server['id']}_$key")) 
			{
				$message[] = "Directory $log_path/$yesterday/{$server['id']}_$key didn't exist ({$server['ip']}) \n";
			} 
			else 
			{
				if(filesize( "$log_path/$yesterday/{$server['id']}_$key") < 10)
				{
					 $message[] = "$log_path/$yesterday/{$server['id']}_$key is empty \n";
				}
			}
	}
}
foreach ($conf_servers_zingplay as $key => $server) 
{
    $key = strtoupper($key);
	 if ($server['active']==1) 
	 {
		
			if (!file_exists("$log_path/$yesterday/{$server['id']}_$key")) 
			{
				$message[] = "Directory $log_path/$yesterday/{$server['id']}_$key didn't exist ({$server['ip']}) \n";
			} 
			else 
			{
				if(filesize( "$log_path/$yesterday/{$server['id']}_$key") < 10)
				{
					 $message[] = "$log_path/$yesterday/{$server['id']}_$key is empty \n";
				}
			}
	}
}
if (count($message) != 0) {
    send_email2($mail_from, $mail_to, '[NLVN] Check daily log-Log Character', $message);
}

function send_email($mail_from, $mail_to, $title, $message) {   
    global $today;
    $data = "Now is $today\n";
    $data .= "There are some errors in checking daily log\n";
    foreach ($message as $msg) $data .= "\n$msg";
    system("/opt/scripts/mail_format.sh \"$mail_from\" \"$mail_to\" \"$title\" \"$data\" | /usr/sbin/sendmail -f \"$mail_from\" -t");
}

function send_email2($mail_from, $mail_to, $title, $message) {
    global $today, $mail_cc;
    $title .= " $today";
    $data = "<p>Now is $today</p>";
    $data .= "<p>There are some errors in checking daily log</p>";
    foreach ($message as $msg) $data .= "<p>$msg</p>";
    $headers  = 'MIME-Version: 1.0' . "\r\n";    
    $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
    //$headers .= 'To: Mary <mary@example.com>, Kelly <kelly@example.com>' . "\r\n";
    $headers .= 'From: NLVN Alert <alert@idngoalong.zing.vn>' . "\r\n";
    $headers .= 'Cc: '.$mail_cc. "\r\n";
    //$headers .= 'Bcc: birthdaycheck@example.com' . "\r\n";
    $result = mail($mail_to, $title, $data, $headers);
}
