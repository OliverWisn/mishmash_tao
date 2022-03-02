# mirror_of_page.py
# -*- coding: utf-8 -*-

import os
import time

def mirror(url, response):
    clean_url = url.replace('http://', '').replace('https://', '').rstrip('/')
    parts = clean_url.split('?')[0].split('/')
    root = parts[0]
    webpage = parts[-1]
    parts.remove(root)
    try:
        parts.remove(webpage)
    except ValueError:
        pass
    prefix = root + '_mirror'
    try:
        os.mkdir(prefix)
    except OSError:
        pass
    suffix = ''
    if parts:
        for directory in parts:
            suffix += directory + '/'
            try:
                os.mkdir(prefix + '/' + suffix)
            except OSError:
                pass
    path = prefix + '/' + suffix
    trail = ''
    if '.' not in webpage:
        trail += '.html'
    if webpage == root:
        name = lambda: "flashscore{}".format(time.strftime(\
            "%Y%m%d-%H.%M.%S"))
        name_of_the_file = path + name() + trail
    else:
        date_and_time = lambda: "{}".format(time.strftime("%Y%m%d-%H.%M.%S"))
        name = webpage + date_and_time()
        name_of_the_file = path + name + trail
    with open(name_of_the_file, 'w+', encoding="utf-8") as out_file:
        out_file.write(response)