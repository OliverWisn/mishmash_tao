from urllib.request import urlopen
#Retrieve HTML string from the URL
html = urlopen("http://www.pythonscraping.com/pages/warandpeace.html")
with open("pure_html_site_file_urllib.txt", "w") as f:
    f.write(html.read().decode('utf-8'))