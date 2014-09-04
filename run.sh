#!/usr/bin/env sh

SETTINGS_FILE="settings.json"
export NODE_OPTIONS="--debug"

meteor --settings=${SETTINGS_FILE}
