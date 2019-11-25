#!/usr/bin/python
import requests
import threading
from multiprocessing.dummy import Pool

def cek(url):
	try:
		login = ['/admin', '/admin/login.php', '/administrator', '/login.php', '/cms/','/panel', '/adminpanel', '/master']
		for admin in login:
			try:
				r = requests.get(url+admin)
				if 'name="user' in r.text:
					print "[+] Found =>"+ url+admin
					o = open('result.txt', "a")
					o.write(url+admin+"\n")
				else:
					print "[-] " + url+admin
					o = open('not_found.txt', "a")
					o.write(url+"\n")
			except:
				pass
	except:
		pass

o = open("list.txt").readlines()
for i in o:
	x = i.strip()
	t1 = threading.Thread(target=cek, args=(x,))
	t1.start()
