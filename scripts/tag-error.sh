#!/bin/bash

if [ "$1" = "true" ]; then
    DRY_RUN_OPTION="--dry-run"
else
    DRY_RUN_OPTION=""
fi

/usr/local/bin/qbit-race tag-error $DRY_RUN_OPTION