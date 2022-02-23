from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("https://pl.wikipedia.org/wiki/Kevin_Bacon")
bsObj = BeautifulSoup(html, "html.parser")
with open("pure_html_site_file_beautifulsoup_href.txt", "a") as f:
    for link in bsObj.find_all("a"):
        if "href" in link.attrs:
            print(link.attrs["href"])   
            f.write(link.attrs["href"])
            f.write("\n")