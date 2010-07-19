#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
from K3Util.LogFile.ATrack import LogParser

logList = []

for line in sys.stdin:
    line = line.strip()
    parser = LogParser()
    log = parser.parse_as_search(line)
    if log.kwd != 'null':
        logList.append((log.token, float(log.float_time), log.kwd, 1))

sortedList = sorted(logList)
for log in sortedList:
    print '%s %f %s %s' % log
