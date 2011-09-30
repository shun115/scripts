# -*- coding: utf-8 -*-
import sys
from urllib2 import urlopen
from BeautifulSoup import BeautifulSoup


def main():
    url = sys.argv[1]

    html = urlopen(url).read()
    soup = BeautifulSoup(html)
    for s in soup.findAll('a'):
        print s.renderContents()


if __name__ == '__main__':
    main()
