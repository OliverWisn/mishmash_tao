# scraper with basic logging.py

import urllib.request
from bs4 import BeautifulSoup
import logging

    # logging.basicConfig(filename='example.log', encoding='utf-8'), 
    #   level=logging.DEBUG)

# create logger
logger = logging.getLogger('Mainstream')
logger.setLevel(logging.DEBUG)

# create file handler which logs even debug messages
fh = logging.FileHandler('events.log')
fh.setLevel(logging.DEBUG)

# create console handler and set level to debug
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)

# create formatter and add it to the handlers
formatter = logging.Formatter('%(asctime)s - %(name)-12s - %(levelname)-8s \
    - %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p')
    # format='%(asctime)s %(name)-12s %(levelname)-8s %(message)s',
    #                    datefmt='%m-%d %H:%M',
    # formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s 
    #   - %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p')
ch.setFormatter(formatter)
fh.setFormatter(formatter)

# add the handlers to logger
logger.addHandler(ch)
logger.addHandler(fh)

# 'application' code
    # logging.basicConfig(filename='example.log', encoding='utf-8')
logger.debug('debug message')
logger.info('info message')
logger.warning('warn message')
logger.error('error message')
logger.critical('critical message')


    # logger = logging.getLogger('simple_example')
    # logger.setLevel(logging.DEBUG)
        # create file handler which logs even debug messages
    # fh = logging.FileHandler('spam.log')
    # fh.setLevel(logging.DEBUG)
        # create console handler with a higher log level
    # ch = logging.StreamHandler()
    # ch.setLevel(logging.ERROR)
        # create formatter and add it to the handlers
    # formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    # ch.setFormatter(formatter)
    # fh.setFormatter(formatter)
        # add the handlers to logger
    # logger.addHandler(ch)
    # logger.addHandler(fh)

        # 'application' code
    # logger.debug('debug message')
    # logger.info('info message')
    # logger.warning('warn message')
    # logger.error('error message')
    # logger.critical('critical message')


class Scraper:
    def __init__(self, site):
        self.site = site

    def scrape(self):
        r = urllib.request.urlopen(self.site)
        html = r.read()
        parser = "html.parser"
        sp = BeautifulSoup(html, parser)
        with open("output.txt", "w") as f:
            for tag in sp.find_all("a"):
                url = tag.get("href")
                if url is None:
                    continue
                if "html" in url:
                    print("\n" + url)
                    f.write(url + "\n")

news = "https://www.wp.pl//"
Scraper(news).scrape()
