"""
Usage:
  python azdoc_v3.py parse

Options:
  -h --help     Show this screen.
  --version     Show version.
"""

import json
import os
import sys
import xml.sax


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
        # template = "<Blob values count:{0}>"
        # return template.format(len(self.values))
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
        # xml.sax.parse(open(filename), self)
        # return self
        parser = xml.sax.make_parser()
        parser.setFeature(xml.sax.handler.feature_namespaces, 0)
        parser.setContentHandler(self)
        parser.parse(open(filename))
        return self

    def endDocument(self):
        self.completed = True

    def characters(self, chars):
        print('characters: ' + str(chars))
        self.curr_text = self.curr_text + str(chars)

        # if len(self.curr_text) > 0:
        #     self.curr_text = self.curr_text + chars
        # else:
        #     self.curr_text = chars

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
        print('startElement; tag: {}  path: {}'.format(tag_name, path))

        if path == self.blob_path:
            self.curr_blob = Blob()
            self.blobs.append(self.curr_blob)

    def endElement(self, tag_name):
        path = self.curr_path()
        print('endElement; curr_text: {}'.format(self.curr_text))

        if self.blob_path in path:
            self.curr_blob.set(tag_name, str(self.curr_text))

        if path == self.blob_path:
            print(str(self.curr_blob))

        self.heirarchy.pop()
        self.reset_curr_text()


if __name__ == "__main__":

    if len(sys.argv) > 1:
        func = sys.argv[1].lower()

        if func == 'parse':
            infile = 'opbuildstorageprod_list.xml'
            outfile = sys.argv[2]  # 'opbuildstorageprod_parsed.txt'
            handler = EnumerationResultsHandler()
            handler.parse(infile)

            for blob in handler.blobs:
                print(blob.get('Name'))

            # with open(outfile, 'wt') as f:
            #     f.write((str(handler)))
            print('blob count: {}'.format(len(handler.blobs)))

        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
        print_options('Error: no function argument provided.')
