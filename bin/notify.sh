#! /bin/bash

__FILE__=`readlink -e ${BASH_SOURCE[0]}`
__DIR__=$(dirname $(dirname ${__FILE__}))

if [ -f /tmp/radio.log ]; then
    if [ `cat /tmp/radio.log | grep -a "ICY-META: StreamTitle='.*';" | grep -a -v "ICY-META: StreamTitle=' - ';" | wc -l` -gt 0 ]; then
        STATION_NAME=`cat /tmp/.radio.station.name`
        STATION_ICON=`cat /tmp/.radio.station.icon`
        TRACK=$(cat /tmp/radio.log | grep -a "ICY-META: StreamTitle='.*';" | grep -a -v "ICY-META: StreamTitle=' - ';" | tail -n1 | cut -d'=' -f2-100 | tr '"' "'");

        > /tmp/radio.log;

        notify-send -t 12500 --icon=${STATION_ICON} "${STATION_NAME}" "${TRACK:1:-2}"
    fi
fi
