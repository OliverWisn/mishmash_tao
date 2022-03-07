import time

from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options

options = Options()
options.add_argument("--headless")
driver = Firefox(options=options)
driver.get("https://www.flashscore.com/")
time.sleep(20)
print(driver.page_source)
with open("read_into_textfile_selenium.txt", "a", encoding="utf-8") as f:
    f.write(driver.page_source)

driver.quit()