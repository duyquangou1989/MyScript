if [ -f /home/piserver/PIServer.jar ]
then
	mv /home/piserver/PIServer.jar /home/piserver/`date +%Y-%m-%d_%H_%M`.jar
else
	echo "File PIServer.jar does not exist"
fi
