from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("https://pl.wikipedia.org/wiki/Kevin_Bacon")
bs = BeautifulSoup(html, "html.parser")
for imag in bs.find_all("img"):
    if "src" in imag.attrs:
        print(imag.attrs["src"])    