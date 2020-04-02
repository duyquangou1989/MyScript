#!/usr/bin/python
from datetime import datetime,timedelta
import gnupg

timenow = datetime.strftime(datetime.now(),'%Y%m%d')
yesterday = datetime.strftime(datetime.now() - timedelta(1), '%Y%m%d')
emailsender = ''
passender = ''
gpg = gnupg.GPG(gnupghome = '/root/.gnupg')
public_keys = gpg.list_keys()
private_keys = gpg.list_keys(True)
bkfarmpath = '/data/backupfarm/'
tempgcs = '/data/tempgcs/'