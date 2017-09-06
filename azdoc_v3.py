"""
Usage:
  python azdoc_v3.py get_blob_list
  python azdoc_v3.py parse1 tmp/response-0.xml
  python azdoc_v3.py aggregate_responses

Options:
  -h --help     Show this screen.
  --version     Show version.
"""

import json
import os
import sys
import xml.sax

import requests


class HttpClient:

    def __init__(self):
        self.base_url = 'https://opbuildstorageprod.blob.core.windows.net/output-pdf-files?restype=container&comp=list&maxresults=5000'
        self.curr_url = self.base_url
        self.continue_to_get = True
        self.continuation_marker = ''
        self.last_response_code = 0
        self.last_response_text = ''
        self.captured_response_files = list()

    def get_blob_list(self):
        self.continue_to_get = True
        for idx in range(10):
            if self.continue_to_get:
                self.get_next_list(idx)
        self.write_files_list()

    def get_next_list(self, idx):
        print('get_next: {}'.format(idx))
        url = self.build_url(idx)
        if url is None:
            print('end of list pagination')
            self.continue_to_get = False
        else:
            print('invoking url: {}'.format(url))
            r = requests.get(url)
            self.capture_response(url, r, idx)

    def build_url(self, idx):
        if idx < 1:
            return self.base_url
        else:
            self.continuation_marker = self.parse_continuation_marker()
            if len(self.continuation_marker) > 0:
                return '{}&marker={}'.format(self.base_url, self.continuation_marker)
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
        outfile = 'tmp/response-{}.xml'.format(idx)
        print('response, code: {} length: {} -> {}'.format(r.status_code, len(r.text), outfile))
        self.last_response_text = r.text
        with open(outfile, 'wt') as out:
            out.write(r.text)
            print('file written: {}'.format(outfile))

        print("{} {} {}".format(r.status_code, url, len(r.text)))
        self.captured_response_files.append(outfile)

    def write_files_list(self):
        jstr = json.dumps(self.captured_response_files, sort_keys=True, indent=2)
        outfile = 'tmp/responses.json'
        with open(outfile, 'wt') as out:
            out.write(jstr)
            print('file written: {}'.format(outfile))

    def index_of(self, substring):
        try:
            return self.last_response_text.index(substring)
        except:
            return -1

    def sample_xml_with_marker(self):
        return '<NextMarker>2!164!MDAwMDc3IWVuLXVzL1ZTLmNvcmUtZG9jcy9saXZlL2FwaS9fc3BsaXR0ZWQvU3lzdGVtLldpbmRvd3MuTWVkaWEuVGV4dEZvcm1hdHRpbmcucGRmITAwMDAyOCE5OTk5LTEyLTMxVDIzOjU5OjU5Ljk5OTk5OTlaIQ--</NextMarker>'


class Blob(object):

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
        # print('characters: ' + str(chars))
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
        # print('startElement; tag: {}  path: {}'.format(tag_name, path))

        if path == self.blob_path:
            self.curr_blob = Blob()
            self.blobs.append(self.curr_blob)

    def endElement(self, tag_name):
        path = self.curr_path()
        # print('endElement; curr_text: {}'.format(self.curr_text))

        if self.blob_path in path:
            self.curr_blob.set(tag_name, str(self.curr_text))

        if path == self.blob_path:
            print(str(self.curr_blob))

        self.heirarchy.pop()
        self.reset_curr_text()


class Aggregator(object):

    def __init__(self):
        self.response_files = list()
        self.blobs = list()
        self.azure_blobs = list()

    def aggregate(self):
        self.response_files = self.read_parse_json_file('tmp/responses.json')
        for infile in self.response_files:
            handler = EnumerationResultsHandler()
            handler.parse(infile)
            for blob in handler.blobs:
                self.blobs.append(blob.values)

        jstr = json.dumps(self.blobs, sort_keys=True, indent=2)
        outfile = 'tmp/aggregated_blobs.json'
        with open(outfile, 'wt') as out:
            out.write(jstr)
            print('file written: {}'.format(outfile))
            print('blob count:   {}'.format(len(self.blobs)))

        for blob in self.blobs:
            url = blob['Url']
            if '/en-us/Azure.azure-documents/live/' in url:
                self.azure_blobs.append(url)

        outfile = 'tmp/aggregated_azure_blobs.json'
        jstr = json.dumps(self.azure_blobs, sort_keys=True, indent=2)
        with open(outfile, 'wt') as out:
            out.write(jstr)
            print('file written: {}'.format(outfile))
            print('blob count:   {}'.format(len(self.azure_blobs)))

    def read_parse_json_file(self, infile):
        with open(infile) as f:
            return json.loads(f.read())


if __name__ == "__main__":

    if len(sys.argv) > 1:
        func = sys.argv[1].lower()

        if func == 'get_blob_list':
            client = HttpClient()
            client.get_blob_list()

        elif func == 'parse1':
            infile  = sys.argv[2]
            handler = EnumerationResultsHandler()
            handler.parse(infile)

            for blob in handler.blobs:
                print(blob.get('Url'))

            print('blob count: {}'.format(len(handler.blobs)))

        elif func == 'aggregate_responses':
            aggregator = Aggregator()
            aggregator.aggregate()

        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
        print_options('Error: no function argument provided.')
