import time

from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options
from bs4 import BeautifulSoup

options = Options()
options.add_argument("--headless")
driver = Firefox(options=options)
driver.get("https://www.flashscore.com/")
time.sleep(10)
pageSource = driver.page_source
bsObj = BeautifulSoup(pageSource, "html.parser")
print(bsObj)
with open("read_into_textfile_selenium_bs.txt", "a", encoding="utf-8") as f:
    f.write(bsObj.decode('utf-8'))

driver.quit()