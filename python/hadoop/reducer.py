#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
from K3Util.Distance import EditDistance

wordDistanceList = []
bfrTime=0.0
bfrToken=''
bfrWord=''

for line in sys.stdin:
    line = line.strip()
    token, time, word, count = line.split(' ',3)
    time = float(time)

    if token != bfrToken:
        bfrTime, bfrToken, bfrWord = time, token, word
        continue
    if word == bfrWord:
        bfrTime, bfrToken, bfrWord = time, token, word
        continue
    if time - bfrTime > 120:
        bfrTime, bfrToken, bfrWord = time, token, word
        continue

    try:
        dis = EditDistance.calc(bfrWord, word)
        if int(dis) < 2:
            wordDistanceList.append((bfrWord, word, dis))
    except:
        pass

    bfrTime, bfrToken, bfrWord = time, token, word

wordCheckDic = dict()
for wordDistance in wordDistanceList:
    key = wordDistance[0]+'###'+wordDistance[1]+"###"+str(wordDistance[2])
    if wordCheckDic.has_key(key):
        wordCheckDic[key] = wordCheckDic[key] + 1
    else:
        wordCheckDic[key] = 1

sortedList = sorted(wordCheckDic.items(),
                    key=lambda x:x[1],
                    reverse=True)

print 'reducer---------------------------\n'
for result in sortedList:
    words = result[0].split('###')
    print '%s \t %s \t count:%s \t distance:%s' % (words[0], words[1], result[1], words[2])

