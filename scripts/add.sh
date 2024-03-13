#!/bin/bash

if [ "$3" = "true" ]; then
    TAG_OPTION="--tracker-tags"
else
    TAG_OPTION="--no-tracker-tags"
fi

/usr/local/bin/qbit-race add --path "$1" --category "$2" $TAG_OPTION --extra-tags "$4"