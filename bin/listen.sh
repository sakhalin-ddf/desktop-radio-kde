#! /bin/bash

__FILE__=`readlink -e ${BASH_SOURCE[0]}`
__DIR__=$(dirname $(dirname ${__FILE__}))

URL=`cat /tmp/.radio.station.url`
STATION_NAME=`cat /tmp/.radio.station.name`
STATION_ICON=`cat /tmp/.radio.station.icon`

if [ -z "${URL}" ]; then
    echo "There is unknown station"
    exit 1
fi

TRACK=$(curl https://radiorecord.ru/api/stations/now/ | jq '.result[] | select(.id | contains('$(cat /tmp/.radio.station.id)')).track | .artist + " - " + .song' -r)

notify-send -t 12500 --icon=${__DIR__}/${STATION_ICON} "${STATION_NAME}" "${TRACK}"

cvlc "${URL}" > /tmp/radio.log 2>&1
