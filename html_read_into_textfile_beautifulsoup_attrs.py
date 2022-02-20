from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("http://www.pythonscraping.com/pages/page3.html")
bsObj = BeautifulSoup(html, "html.parser")
with open("pure_html_site_file_beautifulsoup_attrs.txt", "a") as f:
    for imag in bsObj.find_all("img"):
        if "src" in imag.attrs:
            print(imag.attrs["src"])   
            f.write(imag.attrs["src"])
            f.write("\n")