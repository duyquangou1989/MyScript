pid=$(ps aux | grep "\-jar" | awk '/piserver/ && !/awk/ { print $2 }')
echo "PID=" $pid

echo "Killing PI process ... "

sleep 5

kill -9 $pid

status=$?

sleep 10

if [ $status -eq 0 ]
then
	echo "PID" $pid "Killed !!!"
else
	echo "Kill process FAIL !!! Exiting . . ."
	exit
fi
	

if [ -f /home/piserver/PIServer.jar ] 
then
	mv /home/piserver/PIServer.jar /home/piserver/`date +%Y-%m-%d_%H_%M`.jar
	status1=0
else
	echo "File PIServer.jar does not exist"
	status1=1
fi

sleep 5
	
if [ -f /home/piserver/PIBot.jar ]
then
	echo "PIBot found !!! "
	read -p "Rename PIBot ok y/n ? " re
	if [[ $re == 'y' || $re == 'Y' ]]
	then
		mv /home/piserver/PIBot.jar /home/piserver/PIBot_`date +%Y-%m-%d_%H_%M`.jar
		status2=0
	else
		echo "You choose No. Continue . . ."
	fi
else
	echo "File PIBot.jar does not exist"
	status2=1
fi

read -p  "Please upload PIServer and PIBot to /home/piserver ... Upload done ??? " up
if [[ $up == 'y' || $up == 'Y' ]]
then
	if [ $status1 -eq 0  ]
	then
		echo "PIServer and PIBot rename ok !!! ... "
		if [ -f /home/piserver/PIServer.jar ] 
		then
			echo "PIServer found ..."
			cd /home/piserver; /usr/local/jdk1.6.0_24/bin/java -jar /home/piserver/PIServer.jar -db=127.0.0.1:3306 -dbname=vmserver -dbpass=vmserverpp12 -memcache=127.0.0.1:11211 -vcore=http://127.0.0.1:6868/VCore/api/ -cardpay=http://127.0.0.1:6868/VPayCard/api/ -socketport=16800 -httpport=16801 -vbhost=127.0.0.1 -vbport=16868 -pidb=PIDB -gfsdb=gfsserver -vcenterdb=vivoo_center -server=1&
			cd /home/piserver; /usr/local/jdk1.6.0_24/bin/java -jar /home/piserver/PIServer.jar -db=127.0.0.1:3306 -dbname=vmserver -dbpass=vmserverpp12 -memcache=127.0.0.1:11212 -vcore=http://127.0.0.1:6868/VCore/api/ -cardpay=http://127.0.0.1:6868/VPayCard/api/ -socketport=17800 -httpport=17801 -vbhost=127.0.0.1 -vbport=17868 -pidb=PIDB2 -gfsdb=gfsserver2 -vcenterdb=vivoo_center -server=2&
		else
			echo "PIServer NOT found ... "
		fi
	else
		echo "Rename FAILED ... "
		exit
	fi
		
read -p "Run PIBot Y/N ?" ans
	
if [[ $ans == 'Y' || $ans == 'y' ]]
then
	if [ -f /home/piserver/PIBot.jar ]
	then
		echo "PIBot found ... "
		cd /home/piserver; /usr/local/jdk1.6.0_24/bin/java -jar /home/piserver/PIBot.jar -pihost=183.91.14.162 -port=17800 &
		cd /home/piserver; /usr/local/jdk1.6.0_24/bin/java -jar /home/piserver/PIBot.jar -pihost=183.91.14.162 -port=16800 &
	else
		echo "PIBot.jar NOT found ... Exiting ..."
		exit
	fi
else
	echo "You choose dont run PIBot --> Exiting . . ."
	exit
fi
else
	echo "You dont upload PIServer ... Exiting ... "
	exit
fi