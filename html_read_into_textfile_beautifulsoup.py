from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("http://pl.wikipedia.org/wiki/Star_Trek")
bsObj = BeautifulSoup(html, "html.parser")
with open("pure_html_site_file_beautifulsoup.txt", "w") as f:
    f.write(bsObj.decode('utf-8'))