#!/usr/bin/python
import os, sys
import gnupg

passphrase = '2V4nwd974tM1'
gpg = gnupg.GPG(gnupghome = '/root/.gnupg')
fileinput = sys.argv[1]
outputdir = sys.argv[2]
with open(fileinput,"rb") as f:
	status = gpg.encrypt_file (
			f, recipients = ["quang.tong@vtijs.com"],
			passphrase = passphrase,
			armor = False,
			output = outputdir + fileinput + ".gpg"
		)
	if status.ok == True:
		print 'File ' + fileinput + ' encrypt Success'
	else:
		print 'File ' + fileinput + ' encrypt Failed'
