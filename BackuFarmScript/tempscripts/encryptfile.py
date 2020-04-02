#!/usr/bin/python

import os
import gnupg
gpg = gnupg.GPG(gnupghome = '/root/.gnupg')

os.system("mkdir -p encrypted")

files_dir = []
files = [f for f in os.listdir(".") if os.path.isfile(f)]
for f in files:
    files_dir.append(f)

for x in files_dir:
    with open(x, "rb") as f:
        status = gpg.encrypt_file(f,recipients=["quang.tong@vtijs.com"],output= files_dir[files_dir.index(x)]+".gpg")
        print("ok: ", status.ok)
        print("status: ", status.status)
        print("stderr: ", status.stderr)
        os.rename(files_dir[files_dir.index(x)] + ".gpg", 'encrypted/' +files_dir[files_dir.index(x)] + ".gpg")