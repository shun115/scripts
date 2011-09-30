# -*- coding: utf-8 -*-
import os
import sys
from pymongo import Connection
from ConfigParser import SafeConfigParser

conffile = os.path.join(os.path.dirname(__file__), "mongo.config")


def main():
    conf = SafeConfigParser()
    conf.read(conffile)
    conn = Connection(conf.get('mongo','HOST'),
                      int(conf.get('mongo','PORT')))
    source = conn.test.source
    docid = 1
    for line in sys.stdin:
        source.insert({'docid': docid,
                       'contents': line.strip()})
        docid += 1


if __name__ == '__main__':
    main()
