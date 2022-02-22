from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("http://www.pythonscraping.com/pages/warandpeace.html")
bsObj = BeautifulSoup(html, "html.parser")
nameList = bsObj.findAll("span", {"class":"green"})
with open("pure_html_site_file_beautifulsoup_classes.txt", "a") as f:
    for name in nameList:
        f.write(name.get_text() + "\n")