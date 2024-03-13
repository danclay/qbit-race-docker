#!/bin/bash

if [ "$2" = "true" ]; then
    TAG_OPTION="--tracker-tags"
else
    TAG_OPTION="--no-tracker-tags"
fi

/usr/local/bin/qbit-race race --info-hash "$1" $TAG_OPTION --extra-tags "$3"