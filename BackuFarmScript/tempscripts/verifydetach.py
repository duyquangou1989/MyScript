#!/usr/bin/python
import os, sys
import gnupg
gpg = gnupg.GPG(gnupghome = '/root/.gnupg')
files_dir = [] 
files = [f for f in os.listdir(".") if os.path.isfile(f)]
for f in files:
	files_dir.append(f)

for i in files_dir:
     with open("signatures/" + i + ".sig", "rb") as f:
         verify = gpg.verify_file(f, i)
         print(i + " ", verify.status)