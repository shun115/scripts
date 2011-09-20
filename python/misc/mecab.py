#!/Users/shun/.virtualenvs/2.7.2/bin python
# -*- coding: utf-8 -*-


import MeCab

def main():
    m = MeCab.Tagger()
    print m.parse('すもももももももものうち')


if __name__ == '__main__':
    main()
