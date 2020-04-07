#!/usr/bin/python

import subprocess
import json

UserQuery = subprocess.Popen(['/usr/local/openvpn_as/scripts/sacli UserPropGet'],shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT).communicate()[0].strip()
#ip_connecting = subprocess.Popen(["route -n | grep as0t0 | grep -v \"10.75.76.0\" | awk \'BEGIN {FS=\" \"}; {print $1}\'"],shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT).communicate()[0].strip()
ip_connecting =  subprocess.Popen(["route -n | grep as0t0 | grep -v \"10.75.76.0\" | awk \'BEGIN {FS=\" \"}; {print $1}\'"],shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT).communicate()[0].splitlines()
json_conv = json.loads(UserQuery)

for k,v in json_conv.items():
	if 'conn_ip' in v:
		for ip in ip_connecting:
			if ip == v['conn_ip']:
				print 'sala ' + k + ' ' + v['conn_ip']
