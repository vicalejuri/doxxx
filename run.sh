#!/usr/bin/env sh

SETTINGS_FILE="settings.json"
export NODE_OPTIONS="--debug"

mrt --settings=${SETTINGS_FILE} &
