from urllib.request import urlopen
#Retrieve HTML string from the URL
html = urlopen("http://www.pythonscraping.com/pages/warandpeace.html")
print(html.read())