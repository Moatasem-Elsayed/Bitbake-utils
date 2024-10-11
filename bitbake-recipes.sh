#!/bin/bash

getrecipes() {
    recipe=$1
    layers= "${@:2}"
    recipes=()
    for layer in "${layers[@]}"; do
        bb_file=$(find "${layer}/" -type f -name "${recipe}*.bb" 2>/dev/null)

        if [ -n "$bb_file" ]; then
            recipes+=(\"$bb_file\")
        fi
    done
    echo "${recipes[@]}"
}
