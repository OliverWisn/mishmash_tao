# pennie_unittests.py

import os
import time

from seleniumwire import webdriver
from selenium.webdriver.firefox.firefox_profile import FirefoxProfile
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary
import unittest

class TestUrlStatusHeaders(unittest.TestCase):
    """
    Class to test whether the website with the right url is being 
    downloaded correctly, whether it has the right status and whether 
    it has the set headers correctly.
    """
    # Variables to test.
    tes_url = None
    tes_status_code = None
    tes_head_usr_agt = None
    tes_head_acc = None
    tes_head_acc_lang = None
    driver = None

    @classmethod
    def setUpClass(cls):
        """
        Data scraping for tested global variables with code executed 
        once for all tests.
        """
        # Variable with the URL of the website.
        my_url = 'https://httpbin.org/headers'

        # Preparing of the Tor browser for the work.
        driver = cls.firefoxdriver(my_url)

        # Adding the headers to the browser - set the interceptor on the 
        #   driver.
        driver.request_interceptor = cls.interceptor

        # Loads the website code as the Selenium object.
        driver.get(my_url)
        TestUrlStatusHeaders.driver = driver

        # Access requests via the `requests` attribute.
        for request in driver.requests:
            if request.response:
                if request.url:
                    tes_url = request.url
                    TestUrlStatusHeaders.tes_url = tes_url
                    print(tes_url)
                if request.response.status_code:
                    tes_status_code = request.response.status_code
                    TestUrlStatusHeaders.tes_status_code = tes_status_code
                    print(tes_status_code)
                if request.headers['User-Agent']:
                    tes_head_usr_agt = request.headers['User-Agent']
                    TestUrlStatusHeaders.tes_head_usr_agt = tes_head_usr_agt
                    print(tes_head_usr_agt)
                if request.headers['Accept']:
                    tes_head_acc = request.headers['Accept']
                    TestUrlStatusHeaders.tes_head_acc = tes_head_acc
                    print(tes_head_acc)
                if request.headers['Accept-Language']:
                    tes_head_acc_lang = request.headers['Accept-Language']
                    TestUrlStatusHeaders.tes_head_acc_lang = tes_head_acc_lang
                    print(tes_head_acc_lang)

        time.sleep(5)
        driver.quit()
    
    @classmethod          
    def firefoxdriver(cls, my_url):
        """Preparing of the Tor browser for the work."""
        # The location of the Tor Browser bundle
        #   for my laptop.
        # tbb_dir = r'C:\Users\Oliver\Desktop\Tor Browser'
        #   for my mainframe.
        tbb_dir = r'C:\Users\olive\OneDrive\Pulpit\Tor Browser'

        # Set the Tor Browser binary and profile.
        tb_binary = tbb_dir + r'\Browser\firefox.exe'
        tb_profile = tbb_dir + r'\Browser\TorBrowser\Data\Browser\profile.default'
        binary = FirefoxBinary(tb_binary)
        profile = FirefoxProfile(tb_profile)

        # Open Tor Browser to allow to work on the proxy.
        torexe = os.popen(tb_binary)

        # Disable Tor Launcher to prevent it connecting the Tor Browser to 
        #   Tor directly.
        os.environ['TOR_SKIP_LAUNCH'] = '1'
        os.environ['TOR_TRANSPROXY'] = '1'

        # Disable HTTP Strict Transport Security (HSTS) in order to have 
        #   seleniumwire between the browser and Tor.
        profile.set_preference("security.cert_pinning.enforcement_level", 0)
        profile.set_preference("network.stricttransportsecurity.preloadlist", False)

        # Tell Tor Button it is OK to use seleniumwire
        profile.set_preference("extensions.torbutton.local_tor_check", False)
        profile.set_preference("extensions.torbutton.use_nontor_proxy", True)

        # Enable JavaScript at all, otherwise JS stays disabled regardless 
        #   of the Tor Browser's security slider value.
        profile.set_preference("browser.startup.homepage_override.mstone", "68.8.0")

        # Configure seleniumwire to upstream traffic to Tor running on 
        #   port 9150.
        # It is possible to increase/decrease the timeout if you are trying
        #   to a load page that requires a lot of requests. It is in 
        #   seconds.
        options = {
            'proxy': {
                'http': 'socks5h://127.0.0.1:9150',
                'https': 'socks5h://127.0.0.1:9150',
                'connection_timeout': 20
            }
        }

        driver = webdriver.Firefox(firefox_profile=profile,
                                    firefox_binary=binary,
                                    seleniumwire_options=options)

        return driver

    @classmethod
    def interceptor(cls, request):
        """
        Adding the headers to the browser - create a request interceptor.
        """
        del request.headers['User-Agent']
        request.headers['User-Agent'] = ('Mozilla/5.0 (Windows NT 10.0;rv:102.0)'+
            ' Gecko/20100101 Firefox/102.0')
        del request.headers['Accept']
        request.headers['Accept'] = ('text/html,application/xhtml+xml,application'+
            '/xml;q=0.9,image/avif,image/webp,*/*;q=0.8')
        del request.headers['Accept-Language']
        request.headers['Accept-Language'] = 'en-US,en;q=0.5'

    def test_Tested_Url(self):
        tes_url = TestUrlStatusHeaders.tes_url
        self.assertEqual('https://httpbin.org/headers', tes_url)

if __name__ == '__main__':
    unittest.main()