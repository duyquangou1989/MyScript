#!/usr/bin/python

html = """\
<html>
<body>
<h3><a>Please check these files below :</a></h3> 
<ul>
"""
for i in range(1,6):
	html = html + "<li>this is line " + str(i) + "</li>"
html = html + '</ul></body></html>'

print html