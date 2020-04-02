#!/usr/bin/python
import bkfarmconfig

def encryptFile(file,dst):
	with open(file,"rb") as f:
		status = bkfarmconfig.gpg.encrypt_file(
				f, recipients=["quang.tong@vtijs.com"],
				output = dst + file +".gpg"
			)

encryptFile('bkfarmconfig.py',bkfarmconfig.tempgcs)