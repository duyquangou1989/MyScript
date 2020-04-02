#!/usr/bin/python

import gnupg, getopt
import os, sys
from datetime import datetime,timedelta

timenow = datetime.strftime(datetime.now(),'%Y%m%d')
yesterday = datetime.strftime(datetime.now() - timedelta(1), '%Y%m%d')
tempDirGPG = '/data/tempgcp/'

def encryptGPG(file,outdir):
	gpg = gnupg.GPG(gnupghome = "/root/.gnupg")
	with open(file,'rb') as f:
		status = gpg.encrypt_file(
				f, recipients = ["quang.tong@vtijs.com"],
				output = outdir + "test.gpg"
			)
	print status.ok
	print status.status
	print status.stderr
	"""
	public_keys = gpg.list_keys()
	private_keys = gpg.list_keys(True)
	print "Pub keys : "
	print public_keys
	print "Private keys : "
	print private_keys
	"""


def main(argv):
	inPath = ''
	outPath = ''
	#project = ''
	try:
		#opts, args = getopt.getopt(argv,'hi:o:p:',["inpath=","outpath=","project="])
		opts, args = getopt.getopt(argv,'hi:o:',["inpath=","outpath="])
	except getopt.GetoptError:
		print 'encryptGPG.py -i <BackupPath> -o <BackupToPath>'

		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print 'encryptGPG.py -i <BackupPath> -o <BackupToPath>'
		elif opt in ("-i","--inpath"):
			inPath = arg
		elif opt in ("-o","--outpath"):
			outPath = arg
		"""elif opt in ("-p","--project"):
			project = arg
		"""
	if os.path.exists(inPath) and os.path.exists(outPath):
		#print os.listdir(inPath)
		#print os.path.isfile(inPath + 'testproject_file.txt')
		files = [f for f in os.listdir(inPath) if os.path.isfile(inPath + f)]
		
	else:
		print "2"

if __name__ == "__main__":
	main(sys.argv[1:])