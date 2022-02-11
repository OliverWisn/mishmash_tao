from urllib.request import urlopen
from bs4 import BeautifulSoup
html = urlopen("https://www.wp.pl")
bsObj = BeautifulSoup(html, "html.parser")
tags = bsObj.findAll(lambda tag: tag.attrs)
for tag in tags:
	print(tag)