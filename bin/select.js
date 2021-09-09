#! /usr/bin/env node

const path = require('path');
const exec = require('./exec.js');
const stations = require('../radio-list.json');

let cmd = 'kdialog --menu "Choose radio station"';

for (let {name} of stations) {
    cmd += ` "${name}" "${name}"`;
}

let selectedStationName = exec(cmd),
    selectedStation = stations.find(({name}) => name === selectedStationName);

if (!selectedStation) {
    console.error(`Unknown station "${selectedStationName}"`);

    process.exit(1);
}

exec(`screen -S radio -X quit`);
exec(`echo "${selectedStation.id}" > /tmp/.radio.station.id`);
exec(`echo "${selectedStation.name}" > /tmp/.radio.station.name`);
exec(`echo "${selectedStation.url}"  > /tmp/.radio.station.url`);
exec(`echo "${selectedStation.icon}" > /tmp/.radio.station.icon`);
exec(`screen -S radio -dm "${__dirname}/listen.sh"`);
