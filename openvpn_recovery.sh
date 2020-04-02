#!/bin/bash

##check openvpn_as need to run OVPN service
grep -w openvpn_as /etc/passwd
if [ $? -ne 0 ];
then
	echo "openvpn_as user not exist, Service can not run, exiting ... "
	exit 1
fi
echo "openvpn_as user exist."

grep -w openvpn /etc/passwd 
if [ $? -ne 0 ];
then
	echo "openvpn user not exist, exiting ... "
	exit 1
else
	echo "openvpn exist, please set passwd if need "
fi

if test ! -f /etc/pam.d/openvpnas; then 
	echo "PamD openvpnas not exist, exiting ... "
	exit 1
fi
echo "PamD openvpnas exist"

if test ! -f /etc/systemd/system/openvpnas.service; then
	echo "SystemD openvpnas not exist, exiting ... "
	exit 1
fi
echo "SystemD openvpnas exist"

#### Start edit config exist OpenvpnAS source 
if [ ! -d /usr/local/openvpn_as ]; then
	echo "OpenvpnAS Dir not exist, exiting ... "
	exit 1
fi

mkdir -p /tmp/openvpnas_tmp

cd /usr/local/openvpn_as

#export server settings 
./scripts/confdba -s > /tmp/openvpnas_tmp/config_server.txt
echo "Export Server Setting done."
read -p "Please Enter Interface Listen : " interface_openvpn
ifconfig $interface_openvpn
if [ $? -ne  0 ];then
	echo "Interface just input not exist"
	exit 1
fi	
if test -z $interface_openvpn ;then
	echo "Interface Empty, exiting ... "
	exit 1.
fi
##Find ip with interface
ip=$(ifconfig $interface_openvpn | grep -w inet | awk -F' ' '{print $2}')
if [ -z "$ip" ];then
	echo "Not find any ip"
	exit 1
fi
echo "Server IP : " $ip
#Check current config ip 
current_config_ip=`cat etc/config.json | grep host.name | awk -F':' '{print $2}' | awk -F'"' '{print $2}'`
current_config_ip=`echo $current_config_ip | sed -e 's/^[[:space:]]*//'`
echo "Current Config IP : " $current_config_ip
if [ "$ip" != "$current_config_ip" ];then
	sed -i "s/$current_config_ip/$ip/g" ./etc/config.json
	echo "Changing config IP done ... "
fi

current_config_interface=`grep "admin_ui.https.ip_address" etc/config.json | awk -F":" '{print $2}' | awk -F'"' '{print $2}'`
current_config_interface=`echo "$current_config_interface" | sed -e 's/^[[:space:]]*//'`
echo "Current Config Interface : " $current_config_interface
if [ "$interface_openvpn" != "$current_config_interface" ]; then
	sed -i "s/$current_config_interface/$interface_openvpn/g" etc/config.json
	echo "Change Interface config.json done "
fi

sed -i "s/$current_config_interface/$interface_openvpn/g" /tmp/openvpnas_tmp/config_server.txt
echo "Change Interface config server temp done "

echo "Reimport setting "
./scripts/confdba -lf /tmp/openvpnas_tmp/config_server.txt 
echo "Reimport done "

rm -rf /tmp/openvpnas_tmp
