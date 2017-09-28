"""
Usage:
  python azdoc.py get_blob_list
  python azdoc.py adhoc_parse_results_xml_file data/response-0.xml
  python azdoc.py aggregate_responses
  python azdoc.py generate_azure_curl_pdfs_bash_script
  python azdoc.py generate_azure_curl_pdfs_powershell_script
  python azdoc.py generate_sharepoint_html

Options:
  -h --help     Show this screen.
  --version     Show version.
"""

# Chris Joakim, Microsoft, 2017/09/28

import json
import os
import sys
import xml.sax

import arrow
import jinja2
import requests


class AzdocConfig:

    # This class defines all configuration values - directories, urls.

    def __init__(self):
        self.blob_query_base_url = 'https://opbuildstorageprod.blob.core.windows.net/output-pdf-files?restype=container&comp=list&maxresults=5000'
        self.max_http_queries = 10
        self.azure_url_subpath = '/output-pdf-files/en-us/Azure.azure-documents/live/'
        self.en_us_docs_subpath = 'https://opbuildstorageprod.blob.core.windows.net/output-pdf-files/en-us/'
        self.pdf_azure_dir = 'pdf/azure/'
        self.pdf_all_dir = 'pdf/all/'
        self.data_dir = 'data'
        self.azure_sharepoint_file = 'doc/azure-azdoc-pdf-files-list.html'
        self.azure_pdf_files_list  = 'doc/azure-azdoc-pdf-files-list.txt'

class BaseObject:

    # This class defines all filenames and file IO functions.

    def __init__(self):
        self.config = AzdocConfig()

    def get_classname(self):
        return self.__class__.__name__

    def current_timestamp(self):
        return arrow.utcnow().to('US/Eastern').format('ddd YYYY-MM-DD')

    def index_of(self, substring):
        try:
            return self.last_response_text.index(substring)
        except:
            return -1

    def read_parse_json_file(self, infile):
        with open(infile) as f:
            return json.loads(f.read())

    def blob_query_response_filename(self, idx):
        return '{}/response-{}.xml'.format(self.config.data_dir, idx)

    def aggregated_responses_filename(self):
        return '{}/responses.json'.format(self.config.data_dir)

    def aggregated_blobs_filename(self):
        return '{}/aggregated_blobs.json'.format(self.config.data_dir)

    def aggregated_azure_blobs_filename(self):
        return '{}/aggregated_azure_blobs.json'.format(self.config.data_dir)

    def curl_azure_bash_script_filename(self):
        return 'azdoc_azure_curl_pdfs.sh'

    def curl_azure_powershell_script_filename(self):
        return 'azdoc_azure_curl_pdfs.ps1'

    def curl_complete_bash_script_filename(self):
        return 'azdoc_complete_curl_pdfs.sh'

    def curl_complete_powershell_script_filename(self):
        return 'azdoc_complete_curl_pdfs.ps1'

    def render_template(self, template_name, data):
        env = jinja2.Environment(loader=jinja2.FileSystemLoader('./templates'))
        return env.get_template(template_name).render(data=data)

    def write_text(self, text, outfile):
        with open(outfile, 'wt') as out:
            out.write(text)
            print('{} - file written: {}'.format(self.classname, outfile))

    def write_lines(self, lines, outfile):
        with open(outfile, "w", newline="\n") as out:
            for line in lines:
                out.write(line)
            print('{} - file written: {}'.format(self.classname, outfile))


class HttpClient(BaseObject):

    # This class queries the blobs, via HTTP, in the Microsoft "opbuildstorageprod"
    # documentation storage container.
    # see https://docs.microsoft.com/en-us/rest/api/storageservices/list-blobs

    def __init__(self):
        BaseObject.__init__(self)
        self.classname = self.get_classname()
        self.blob_query_base_url = self.config.blob_query_base_url
        self.curr_url = self.blob_query_base_url
        self.continue_to_get = True
        self.continuation_marker = ''
        self.last_response_code = 0
        self.last_response_text = ''
        self.captured_response_files = list()

    def get_blob_list(self):
        self.continue_to_get = True
        for idx in range(self.config.max_http_queries):
            if self.continue_to_get:
                self.get_next_list(idx)
        self.write_files_list()

    def get_next_list(self, idx):
        print('{} - get_next: {}'.format(self.classname, idx))
        url = self.build_url(idx)
        if url is None:
            print('{} - end of list pagination'.format(self.classname))
            self.continue_to_get = False
        else:
            print('{} - invoking url: {}'.format(self.classname, url))
            r = requests.get(url)
            self.capture_response(url, r, idx)

    def build_url(self, idx):
        if idx < 1:
            return self.blob_query_base_url
        else:
            self.continuation_marker = self.parse_continuation_marker()
            if len(self.continuation_marker) > 0:
                return '{}&marker={}'.format(self.blob_query_base_url, self.continuation_marker)
            else:
                return None

    def parse_continuation_marker(self):
        begin_tag, end_tag  = '<NextMarker>', '</NextMarker>'
        empty_tag1, empty_tag2 = '<NextMarker />', '<NextMarker/>'
        begin_idx  = self.index_of(begin_tag)
        end_idx    = self.index_of(end_tag)
        empty_idx1 = self.index_of(empty_tag1)
        empty_idx2 = self.index_of(empty_tag2)

        if (empty_idx1 > 0) or (empty_idx2 > 0):
            return ''
        else:
            start_idx = begin_idx + len(begin_tag)
            return self.last_response_text[start_idx:end_idx]

    def capture_response(self, url, r, idx):
        outfile = self.blob_query_response_filename(idx)
        print('{} - response, code: {} length: {} -> {}'.format(self.classname, r.status_code, len(r.text), outfile))
        self.last_response_text = r.text
        self.write_text(self.last_response_text, outfile)

        print("{} - {} {} {}".format(self.classname, r.status_code, url, len(r.text)))
        self.captured_response_files.append(outfile)

    def write_files_list(self):
        jstr = json.dumps(self.captured_response_files, sort_keys=True, indent=2)
        outfile = self.aggregated_responses_filename()
        self.write_text(jstr, outfile)

    def sample_xml_with_marker(self):
        return '<NextMarker>2!164!MDAwMDc3IWVuLXVzL1ZTLmNvcmUtZG9jcy9saXZlL2FwaS9fc3BsaXR0ZWQvU3lzdGVtLldpbmRvd3MuTWVkaWEuVGV4dEZvcm1hdHRpbmcucGRmITAwMDAyOCE5OTk5LTEyLTMxVDIzOjU5OjU5Ljk5OTk5OTlaIQ--</NextMarker>'


class Blob(object):

    # Instances of this class represent a blob returned in the opbuildstorageprod XML HTTP queries.

    def __init__(self):
        self.values = dict()
        self.values['type'] = 'Blob'

    def get(self, key, default_value=''):
        if key in self.values:
            return self.values[key]
        else:
            return default_value

    def set(self, key, value):
        if key and value:
            self.values[key.strip()] = value.strip()

    def __str__(self):
        return str(self.values)

    def __repr__(self):
        return json.dumps(self.values, sort_keys=True, indent=2)


class EnumerationResultsHandler(xml.sax.ContentHandler):

    # Instances of this class are SAX XML parsers, for parsing the captured opbuildstorageprod XML files.

    blob_path = "EnumerationResults|Blobs|Blob"
    blob_path_len = len(blob_path)

    def __init__(self):
        xml.sax.ContentHandler.__init__(self)
        self.heirarchy = list()
        self.blobs = list()
        self.curr_blob = Blob()
        self.curr_text = ''
        self.end_reached = False

    def parse(self, filename):
        parser = xml.sax.make_parser()
        parser.setFeature(xml.sax.handler.feature_namespaces, 0)
        parser.setContentHandler(self)
        parser.parse(open(filename))
        return self

    def endDocument(self):
        self.completed = True

    def characters(self, chars):
        self.curr_text = self.curr_text + str(chars)

    def reset_curr_text(self):
        self.curr_text = ''

    def curr_depth(self):
        return len(self.heirarchy)

    def curr_path(self):
        return '|'.join(self.heirarchy)

    def trackpoint_count(self):
        return len(self.blobs)

    def startElement(self, tag_name, attrs):
        self.heirarchy.append(tag_name)
        self.reset_curr_text()
        path = self.curr_path()

        if path == self.blob_path:
            self.curr_blob = Blob()
            self.blobs.append(self.curr_blob)

    def endElement(self, tag_name):
        path = self.curr_path()
        if self.blob_path in path:
            self.curr_blob.set(tag_name, str(self.curr_text))
        self.heirarchy.pop()
        self.reset_curr_text()


class Aggregator(BaseObject):

    # This class is used to aggregate the list of blobs in the several captured
    # opbuildstorageprod XML files.  An aggregated json file is created.

    def __init__(self):
        BaseObject.__init__(self)
        self.classname = self.get_classname()
        self.response_files = list()
        self.blobs = list()
        self.azure_blobs = list()
        self.pdf_azure_dir = self.config.pdf_azure_dir
        self.pdf_all_dir   = self.config.pdf_all_dir

    def aggregate(self):
        infile = self.aggregated_responses_filename()
        self.response_files = self.read_parse_json_file(infile)
        for infile in self.response_files:
            handler = EnumerationResultsHandler()
            handler.parse(infile)
            for blob in handler.blobs:
                self.blobs.append(blob.values)

        jstr = json.dumps(self.blobs, sort_keys=True, indent=2)
        outfile = self.aggregated_blobs_filename()
        self.write_text(jstr, outfile)

        for blob in self.blobs:
            url = blob['Url']
            if self.config.azure_url_subpath in url:
                self.azure_blobs.append(url)

        outfile = self.aggregated_azure_blobs_filename()
        jstr = json.dumps(self.azure_blobs, sort_keys=True, indent=2)
        self.write_text(jstr, outfile)


class Generator(BaseObject):

    # This class is used to generate bash and powershell curl scripts,
    # as well as HTML reports.

    def __init__(self):
        BaseObject.__init__(self)
        self.pdf_azure_dir = self.config.pdf_azure_dir
        self.pdf_all_dir   = self.config.pdf_all_dir
        self.classname     = self.get_classname()

    def generate_azure_curl_pdfs_script(self, shell_name):
        lines, outfile = list(), None
        url_subpath = self.config.azure_url_subpath
        pdf_urls = self.azure_pdf_urls_list()

        if shell_name.lower() == 'bash':
            lines.append('#!/bin/bash\n\n')
            outfile = self.curl_azure_bash_script_filename()
        else:
            outfile = self.curl_azure_powershell_script_filename()

        lines.append("# Chris Joakim, Microsoft\n")
        lines.append("# Generated on {}\n".format(self.current_timestamp()))
        lines.append("# {} pdf files match path: {}\n".format(len(pdf_urls), url_subpath))

        for idx, url in enumerate(sorted(pdf_urls)):
            lines.append("\n")
            lines.append("echo 'fetching: {} ...'\n".format(url))
            outpdf = url.split('/')[-1]
            if shell_name == 'bash':
                lines.append("curl {} > {}azdoc-{}\n".format(url, self.pdf_azure_dir, outpdf))
            else:
                lines.append("curl {} -OutFile {}azdoc-{}\n".format(url, self.pdf_azure_dir, outpdf))

        lines.append('\necho "done"\n')
        self.write_lines(lines, outfile)

    def generate_complete_curl_pdfs_script(self, shell_name):
        lines, outfile = list(), None
        infile = self.aggregated_blobs_filename()
        blobs  = self.read_parse_json_file(infile)
        url_subpath = self.config.en_us_docs_subpath
        subpath_len = len(url_subpath)
        english_blobs, dpaths = list(), dict()

        if shell_name.lower() == 'bash':
            lines.append('#!/bin/bash\n\n')
            outfile = self.curl_complete_bash_script_filename()
        else:
            outfile = self.curl_complete_powershell_script_filename()

        for blob in blobs:
            url = blob['Url']
            if url_subpath in url:
                if url.endswith('.pdf'):
                    path   = url[subpath_len:]
                    tokens = path.split('/')
                    base   = tokens.pop()
                    dpath  = (self.pdf_all_dir) + ('/'.join(tokens) + '/')
                    dpaths[dpath] = url
                    blob['dpath'] = dpath
                    blob['base']  = base
                    english_blobs.append(blob)

        lines.append("# Chris Joakim, Microsoft\n")
        lines.append("# Generated on {}\n".format(self.current_timestamp()))
        lines.append("# {} pdf files match path: {}\n".format(len(english_blobs), url_subpath))

        lines.append("\n")
        lines.append("# Create output directory structure.\n")
        for dpath in sorted(dpaths.keys()):
            if shell_name.lower() == 'bash':
                lines.append('mkdir -p {}\n'.format(dpath))
            else:
                lines.append('New-Item {} -type directory -force\n'.format(dpath))

        lines.append("\n")
        lines.append("# \n")
        for blob in english_blobs:
            url   = blob['Url']
            dpath = blob['dpath']
            base  = blob['base']
            lines.append("\n")
            lines.append("echo 'fetching: {} ...'\n".format(url))
            if shell_name == 'bash':
                lines.append("curl {} > {}azdoc-{}\n".format(url, dpath, base))
            else:
                lines.append("curl {} -OutFile {}azdoc-{}\n".format(url, dpath, base))

        lines.append('\necho "done"\n')
        self.write_lines(lines, outfile)

    def generate_sharepoint_html(self):
        pdf_urls = self.azure_pdf_urls_list()
        outfile = self.config.azure_sharepoint_file
        data = dict()
        docs = list()
        data['docs'] = docs
        data['date'] = arrow.utcnow().to('US/Eastern').format('ddd YYYY-MM-DD')

        pdf_urls = self.azure_pdf_urls_list()
        for url in pdf_urls:
            doc = dict()
            doc['name'] = url.split('/')[-1]
            doc['url'] = url
            docs.append(doc)

        html = self.render_template('azure-azdoc-pdf-files-list.html', data)
        self.write_text(html, outfile)

    def generate_azure_pdf_list(self):
        pdf_urls = self.azure_pdf_urls_list()
        outfile = self.config.azure_pdf_files_list
        lines = list()

        pdf_urls = self.azure_pdf_urls_list()
        for url in pdf_urls:
            name = url.split('/')[-1]
            lines.append('{}\n'.format(name))

        self.write_lines(sorted(lines), outfile)

    def azure_pdf_urls_list(self):
        pdf_urls = list()
        infile = self.aggregated_blobs_filename()
        blobs = self.read_parse_json_file(infile)
        url_subpath = self.config.azure_url_subpath

        for blob in blobs:
            url = blob['Url']
            if url_subpath in url:
                if url.endswith('.pdf'):
                    pdf_urls.append(url)
        print('{} - {} pdf files match url_subpath {}'.format(self.classname, len(pdf_urls), url_subpath))
        return pdf_urls


if __name__ == "__main__":

    if len(sys.argv) > 1:
        func = sys.argv[1].lower()

        if func == 'get_blob_list':
            client = HttpClient()
            client.get_blob_list()

        elif func == 'adhoc_parse_results_xml_file':
            infile  = sys.argv[2]
            handler = EnumerationResultsHandler()
            handler.parse(infile)
            for blob in handler.blobs:
                print(blob.get('Url'))
            print('blob count: {}'.format(len(handler.blobs)))

        elif func == 'aggregate_responses':
            aggregator = Aggregator()
            aggregator.aggregate()

        elif func == 'generate_azure_curl_pdfs_bash_script':
            generator = Generator()
            generator.generate_azure_curl_pdfs_script('bash')

        elif func == 'generate_azure_curl_pdfs_powershell_script':
            generator = Generator()
            generator.generate_azure_curl_pdfs_script('powershell')

        elif func == 'generate_complete_curl_pdfs_bash_script':
            generator = Generator()
            generator.generate_complete_curl_pdfs_script('bash')

        elif func == 'generate_complete_curl_pdfs_powershell_script':
            generator = Generator()
            generator.generate_complete_curl_pdfs_script('powershell')

        elif func == 'generate_sharepoint_html':
            generator = Generator()
            generator.generate_sharepoint_html()

        elif func == 'generate_azure_pdf_list':
            generator = Generator()
            generator.generate_azure_pdf_list()

        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
        print_options('Error: no function argument provided.')
