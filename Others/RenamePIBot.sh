if [ -f /home/piserver/PIBot.jar ]
then
	mv /home/piserver/PIBot.jar /home/piserver/PIBot_`date +%Y-%m-%d_%H_%M`.jar
	status=$?
	if [ $status -eq 0 ]
	then
		echo "Rename Successfully"
	else
		echo "RENAME FAILED"
	fi
else
	echo "PIBot does not exist"
fi