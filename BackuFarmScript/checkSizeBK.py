#!/usr/bin/python
#Check size compare 2 days
import os, subprocess, sys
from datetime import datetime,timedelta
timenow = datetime.strftime(datetime.now(),'%Y%m%d')
yesterday = datetime.strftime(datetime.now() - timedelta(1), '%Y%m%d')

bkdir = sys.argv[1]
dstdir = sys.argv[2]

print bkdir
print dstdir