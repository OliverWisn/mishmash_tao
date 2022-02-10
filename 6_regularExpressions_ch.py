from urllib.request import urlopen
from bs4 import BeautifulSoup
import re

html = urlopen("https://www.wp.pl")
bsObj = BeautifulSoup(html, "html.parser")
images = bsObj.findAll("img", {"src":re.compile("\.\.\/img.*\.jpg")})
for image in images: 
    print(image["src"])
