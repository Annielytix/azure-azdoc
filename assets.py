"""
Usage:
  python assets.py scrape

Options:
  -h --help     Show this screen.
  --version     Show version.
"""

import json
import os
import sys
import time

import arrow
import jinja2
import requests

from bs4 import BeautifulSoup
from docopt import docopt

VERSION = 'v20170616'

# Python 3 script to Scrape/Spider for Azure Service Image Files.
# Chris Joakim, Microsoft, 2017/06/16


# This class attempts to define all relevant configuration in one place.

class AssetsConfig:

    def __init__(self):
        self.services_url = 'https://docs.microsoft.com/en-us/azure/#pivot=services&panel=all'
        self.base_url = 'https://docs.microsoft.com/en-us/azure/'
        self.html_dir = 'assets/html'
        self.svg_dir  = 'assets/svg'
        self.png_dir  = 'assets/png'
        self.debug    = True


# This class does the actual web scraping and curl script generation,
# using the above AssetsConfig values.

class AssetsUtil:

    def __init__(self):
        self.config   = AssetsConfig()
        self.services_url = self.config.services_url
        self.base_url = self.config.base_url
        self.html_dir = self.config.html_dir
        self.svg_dir  = self.config.svg_dir
        self.png_dir  = self.config.png_dir
        self.debug    = self.config.debug
        self.svg_images = list()

    def scrape(self):
        print('AssetsUtil.scrape...')
        self.get_parse_services_page()
        self.fetch_svg_images()

    def get_parse_services_page(self):
        print('get_parse_root_page start')
        f  = self.html_outfile('services')
        r  = self.get(self.services_url, f);
        bs = BeautifulSoup(r.text, "html.parser")
        image_tags = bs.find_all("img")
        for image_tag in image_tags:
            try:
                src = image_tag['src']
                if src.startswith('media/index/'):
                    if src.endswith('.svg'):
                        print(f'found svg img: {src}')
                        self.svg_images.append(src)
            except:
                pass
        print('get_parse_root_page complete; count: {}'.format(len(self.svg_images)))

    def fetch_svg_images(self):
        for svg_image in self.svg_images:
            try:
                url = f'{self.base_url}{svg_image}'
                print(url)

            except:
                pass

    def get(self, url, f):
        time.sleep(0.5)  # be nice to the web server; throttle requests to it
        if self.debug:
            print("get {} -> {}".format(url, f))
        else:
            print("get {}".format(url))
        r = requests.get(url)
        if self.debug:
            self.capture_response(url, r, f)
        return r

    def capture_response(self, url, r, f):
        with open(f, 'wt') as out:
            # out.write("url:          {}\n".format(url))
            # out.write("status_code:  {}\n".format(r.status_code))
            # out.write("content-type: {}\n".format(r.headers['content-type']))
            out.write(r.text)
        print("{} {} {}".format(r.status_code, url, len(r.text)))

    def create_pdf_url(self, pdf_name):
        return "{}{}.pdf".format(self.pdf_base, pdf_name)

    def html_outfile(self, base):
        return '{}/{}-{}.html'.format(self.html_dir, base, self.epoch())

    def txt_outfile(self, base):
        return '{}/{}-{}.txt'.format(self.svg_dir, base, self.epoch())

    def current_timestamp(self):
        return arrow.utcnow().to('US/Eastern').format('ddd YYYY-MM-DD')

    def epoch(self):
        return time.time()

    def read_parse_json_file(self, infile):
        with open(infile) as f:
            return json.loads(f.read())

    def write_lines(self, lines, outfile):
        with open(outfile, "w", newline="\n") as out:
            for line in lines:
                out.write(line)
            print('file written: {}'.format(outfile))


def print_options(msg):
    print(msg)
    arguments = docopt(__doc__, version=VERSION)
    print(arguments)


if __name__ == "__main__":

    if len(sys.argv) > 1:
        func = sys.argv[1].lower()

        if func == 'scrape':
            s = AssetsUtil()
            s.scrape()

        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
        print_options('Error: no function argument provided.')
