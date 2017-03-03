import sys
import time

import arrow
import requests

from bs4 import BeautifulSoup

# Python 3 script to Scrape/Spider for Azure PDF documentation.
# Chris Joakim, Microsoft, 2017/03/03


# This class attempts to define all relevant configuration in one place.

class AzureDocConfig:

    def __init__(self):
        self.root_url = 'http://azureplatform.azurewebsites.net/en-us/'
        self.pdf_base = 'https://opbuildstorageprod.blob.core.windows.net/output-pdf-files/en-us/Azure.azure-documents/live/'
        self.out_dir  = 'out'
        self.pdf_dir  = 'pdf'
        self.max_docs = 100
        self.debug    = False


# This class does the actual web scraping and curl script generation,
# using the above AzureDocConfig values.

class AzureDocScraper:

    def __init__(self):
        self.config   = AzureDocConfig()
        self.root_url = self.config.root_url
        self.pdf_base = self.config.pdf_base
        self.out_dir  = self.config.out_dir
        self.pdf_dir  = self.config.pdf_dir
        self.max_docs = self.config.max_docs
        self.debug    = self.config.debug
        self.doc_urls = list()
        self.pdf_urls = dict()


    def scrape(self):
        print('AzureDocScraper.scrape...')
        self.get_parse_root_page()
        self.get_parse_doc_urls()
        self.gen_curl_pdfs_script('bash')
        self.gen_curl_pdfs_script('powershell')

    def get_parse_root_page(self):
        print('get_parse_root_page start')
        f  = self.txt_outfile('root')
        r  = self.get(self.root_url, f);
        bs = BeautifulSoup(r.text, "html.parser")
        links = bs.find_all("a")
        for link in links:
            try:
                href = link['href']
                text = '{}'.format(link.get_text()).strip()
                if href:
                    if text == 'Documentation':
                        self.doc_urls.append(href)
            except:
                pass
        print('get_parse_root_page complete; count: {}'.format(len(self.doc_urls)))

    def get_parse_doc_urls(self):
        for idx, doc_url in enumerate(self.doc_urls):
            if idx < self.max_docs:
                name = doc_url.split('/')[-2]
                f  = self.txt_outfile(name)
                r  = self.get(doc_url, f)
                lines = r.text.split('\n')
                for line_idx, line in enumerate(lines):
                    if 'pdf_url_template' in line:
                        name = self.parse_pdf_url_template_name(line)
                        if name:
                            self.pdf_urls[name] = self.pdf_url(name)

    def pdf_url(self, name):
        return self.pdf_base + name

    def gen_curl_pdfs_script(self, shell_name):
        lines   = list()
        outfile = None

        if shell_name == 'bash':
            lines.append('#!/bin/bash\n\n')
            outfile = 'azdoc_curl_pdfs.sh'
        else:
            outfile = 'azdoc_curl_pdfs.ps1'

        lines.append("# Chris Joakim, Microsoft\n")
        lines.append("# Generated on {}\n".format(self.current_timestamp()))

        for idx, name in enumerate(sorted(self.pdf_urls.keys())):
            url = self.pdf_urls[name]
            lines.append("\n")
            lines.append("echo 'fetching: {} ...'\n".format(url))
            if shell_name == 'bash':
                lines.append("curl {} > {}/azdoc-{}\n".format(url, self.pdf_dir, name))
            else:
                lines.append("curl {} -OutFile {}/azdoc-{}\n".format(url, self.pdf_dir, name))
        lines.append('\necho "done"\n')
        self.write_lines(lines, outfile)

    def get(self, url, f):
        time.sleep(0.5)  # be nice to the web server; throttle requests to it
        if self.debug:
            print("get {} -> {}".format(url, f))
        else:
            print("get {}".format(url))
        r = requests.get(url)
        if self.debug:
            self.capture_response(f)
        return r

    def capture_response(self, f):
        with open(f, 'wt') as out:
            out.write("url:          {}\n".format(self.u))
            out.write("status_code:  {}\n".format(self.r.status_code))
            out.write("content-type: {}\n".format(self.r.headers['content-type']))
            out.write("text:\n\n{}\n".format(self.r.text))
        print("{} {} {}".format(self.r.status_code, self.u, len(self.r.text)))

    def parse_pdf_url_template_name(self, line):
        # In lines that look like this:
        #   <meta name="pdf_url_template" content="https://docs.microsoft.com/pdfstore/en-us/Azure.azure-documents/{branchName}/virtual-machines.pdf">
        # Return this:
        #   virtual-machines.pdf
        if line:
            s = line.replace('">', '  ')
            s = s.replace("'", " ")
            n = s.split('/')[-1]
            if '.pdf' in n:
                return n.strip()
        return None

    def txt_outfile(self, base):
        return '{}/{}-{}.txt'.format(self.out_dir, base, self.epoch())

    def current_timestamp(self):
        return arrow.utcnow().format('YYYY-MM-DD HH:mm:ss')

    def epoch(self):
        return time.time()

    def write_lines(self, lines, outfile):
        with open(outfile, "w", newline="\n") as out:
            for line in lines:
                out.write(line)
            print('file written: {}'.format(outfile))


if __name__ == "__main__":

    if len(sys.argv) > 1:
        func = sys.argv[1].lower()

        if func == 'scrape':
            s = AzureDocScraper()
            s.scrape()

        else:
            print("Unknown function: {}".format(func))
    else:
        print("Invalid command-line args")
