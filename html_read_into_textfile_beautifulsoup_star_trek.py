from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("http://pl.wikipedia.org/wiki/Star_Trek")
bsObj = BeautifulSoup(html, "html.parser")
with open("pure_html_site_file_beautifulsoup_star_trek.txt", "w", \
    encoding="utf-8") as f:
    f.write(bsObj.prettify())