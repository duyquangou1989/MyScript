#!/usr/bin/python
import os, sys
from datetime import datetime,timedelta
import gnupg
import subprocess 
import shutil

timenow = datetime.strftime(datetime.now(),'%Y%m%d')
yesterday = datetime.strftime(datetime.now() - timedelta(1), '%Y%m%d')
bkfarmdir = '/data/backupfarm/'
tempgcpdir = '/data/tempgcs/'

projectname = sys.argv[1]
namefil = sys.argv[2]
gpg = gnupg.GPG(gnupghome = '/root/.gnupg')
passphrase = '2V4nwd974tM1'

def detachsign(fileinput,filedst):
	with open(fileinput,"rb") as f:
		stream = gpg.sign_file(f,passphrase=passphrase,detach = True, output=filedst)
	return stream.status

def encryptfile(fileinput,filedst):
	with open(fileinput,"rb") as f:
		status = gpg.encrypt_file (
			f, recipients = ["quang.tong@vtijs.com"],
			passphrase = passphrase,
			armor = False,
			output = filedst
		)
	return status.ok

def pushGCS(folderpath):
	os.system("gsutil -m rsync -R " + folderpath + " gs://dss-backupfarm/testzabbix")
	print "Push GCS Success"

filelist = subprocess.Popen("ls " + bkfarmdir + projectname + " | grep " + namefil,shell=True,stdout=subprocess.PIPE)
output = filelist.stdout.read()
outputline = output.split('\n')
outputline =  [x for x in outputline if len(x.strip()) > 0]
#print outputline
#sys.exit(0)

os.system("mkdir -p " + tempgcpdir + projectname + '/' + timenow)
for file in outputline:
	print bkfarmdir + projectname + "/" + file
	detsign = detachsign(bkfarmdir + projectname + "/" + file,tempgcpdir + projectname + '/' + timenow + "/" + file + ".asc")
	if "created" in detsign:
		if encryptfile(bkfarmdir + projectname + "/" + file,tempgcpdir + projectname + '/' + timenow + "/" + file + ".gpg") == True:
			print file + " encrypt Success "
		else:
			print "Failed"
	else:
		print "detachsign Failed"

pushGCS(tempgcpdir + projectname + '/' )