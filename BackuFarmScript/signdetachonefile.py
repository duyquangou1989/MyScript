#!/bin/python
import os, sys
import gnupg

fileinput = sys.argv[1]
outputdir = sys.argv[2]
passphrase = '2V4nwd974tM1'
gpg = gnupg.GPG(gnupghome = '/root/.gnupg')

with open(fileinput,"rb") as f:
	#print outputdir + fileinput + ".asc"
	stream = gpg.sign_file(f,passphrase=passphrase,detach = True, output=outputdir + fileinput + ".asc")
	if "created" in stream.status:
		print 'File ' + fileinput + " sign Success "
	else:
		print 'File ' + fileinput + ' sign Failed '