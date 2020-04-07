#!/usr/bin/python
#quang.tong
import os, subprocess

sacli_excute = "/usr/local/openvpn_as/scripts/sacli"

def data_to_dict(filepath):
	data_final = {}
	try:
		f = open(filepath,"r")
		for line in f:
                	line = line.strip().split(" ")
                	data_final[line[0]] = line[1]
	except IOError:
		print ('File Error')
	return data_final

def check_account_exist(account):
	output = subprocess.Popen([sacli_excute + " --pfilt " + account + ' UserPropGet | grep conn_ip'],shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT).communicate()[0].strip()
	if output:
		return True
	else:
		return False

def list_ovpn_ip():
	iplist = []
	output = subprocess.Popen([sacli_excute + " UserPropGet | grep conn_ip"],shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT).communicate()[0].strip()	
	for line in output.splitlines():
		output_split = line.split(":")[1].split("\"")
		ip = output_split[1]
		iplist.append(ip)
	return iplist

def check_ip_exist(ip,listip):
	if ip in listip:
		return True
	return False

def create_ovpn_account(account,ovpn_ip):
	os.system(sacli_excute + " --user " + account + " --key conn_ip --value " + ovpn_ip + " UserPropPut")
	os.system(sacli_excute + " --user " + account + " --key access_to.0 --value \"+ROUTE:172.16.0.0/16\" UserPropPut")
	os.system(sacli_excute + " --user " + account + " --key access_to.1 --value \"+ROUTE:192.168.0.0/24\" UserPropPut")
	print 'Create User ' + account + ' with ovpn IP ' + ovpn_ip + ' done !'


def main():
	account_data_file = data_to_dict('/usr/local/openvpn_as/se_scripts/account.txt')
	list_ovpn = list_ovpn_ip()
	for user,ip in account_data_file.items():
		if check_account_exist(user):
			print 'This User ' + user + " exist on db, Plz recheck "
		elif check_ip_exist(ip,list_ovpn) :
			print "IP Exist" + ip
		else:
			#print 'Create OVPN ACCOUNT ' + user + ' with ip ' + ip 
			create_ovpn_account(user,ip)			
	os.system(sacli_excute + ' start')

if __name__ == "__main__":
	main()
