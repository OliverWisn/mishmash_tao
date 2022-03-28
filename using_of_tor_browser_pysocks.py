# using_of_tor_browser_pysocks.py
# -*- coding: utf-8 -*-

import os

import socks
import socket
from urllib.request import urlopen

# Variable with the URL of the website.
# my_url = "http://check.torproject.org"
my_url = "http://icanhazip.com"

# Preparing of the Tor browser for the work.
torexe = os.popen(\
    r"C:\Users\olive\OneDrive\Pulpit\Tor Browser\Browser\firefox.exe")

socks.set_default_proxy(socks.SOCKS5, "localhost", 9150)
socket.socket = socks.socksocket

print(urlopen(my_url).read())

# driver.close()