#!/usr/bin/python

import os, sys, getopt
from datetime import datetime,timedelta

formatpath = 'formatBackup/'
backupdir = '/data/backupfarm/'
timenow = datetime.strftime(datetime.now(),'%Y%m%d')
yesterday = datetime.strftime(datetime.now() - timedelta(1), '%Y%m%d')

def readFormatFile(fileName):
	lineList = [line.rstrip('\n') for line in open(fileName)]
	return lineList

def main(argv):
	projectName = ''
	commitTime = ''
	try:
		opts, args = getopt.getopt(argv,'hp:t:',["project=","time="])
	except getopt.GetoptError:
		print 'checkBackup.py -p <projectname> -t <time>'
		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print 'checkBackup.py -p <projectname> -t <time>'
		elif opt in ("-p","--project"):
			projectName = arg
		elif opt in ("-t","--time"):
			commitTime = arg
	if os.path.exists(backupdir + projectName):
		listFileFormat = readFormatFile(formatpath + projectName + '.format')
		for fileFormat in listFileFormat:
			if os.path.exists(backupdir + projectName + '/' + fileFormat):
				print "File " + fileFormat + " OK"
			else:
				print "File " + fileFormat + " Miss, Please Check"
	else:
		print 'BackupFarm Dir not exist, Exiting ... '
		sys.exit(2)


if __name__=="__main__":
	main(sys.argv[1:])

