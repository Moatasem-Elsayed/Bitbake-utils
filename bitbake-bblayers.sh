#!/bin/bash

getbblayers() {
    bblayers=$(grep -Poz 'BBLAYERS.*\?=(.*\n.*)*' <"${BBPATH}/conf/bblayers.conf")
    layers=()
    for line in $bblayers; do
        if [ -z "$line" ]; then
            continue
        fi
        line=$(echo "$line" | sed "s|\${TOPDIR}|${BBPATH}|g")
        if [ -d "$line" ]; then
            layers+=("$line")
        fi
    done
    echo "${layers[@]}"
}
