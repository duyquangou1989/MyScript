#!/usr/bin/python
import os
import send_mail
def get_size(path="."):
	total_size = 0
	for dirpath, dirnames, filenames in os.walk(path):
		for f in filenames:
			fp = os.path.join(dirpath, f)
			total_size += os.path.getsize(fp)
	return total_size

print get_size()

send_mail.send_mail_alert2('quangtd2@vng.com.vn','/var/log/ntpdate.log')