#!/bin/bash

source bitbake-bblayers.sh
source bitbake-recipes.sh
layers=$(getbblayers)
read -ra layers <<<"$layers"

help() {
    echo "Usage: $(basename "$0") [-d] [-m filename] [-i filename] [-h]"
    echo "Options:"
    echo "  -d    Print help for distro"
    echo "  -m    Specify the machine filename"
    echo "  -i    Specify the image filename"
    echo "  -h    Display this help message"
}
search_distro() {
    echo "Searching for distro"
    for layer in "${layers[@]}"; do
        if (find "$layer/conf/distro" -name "*.conf" -type f | grep -q .) 2>/dev/null >/dev/null; then
            find "$layer/conf/distro" -name "*.conf" -type f
        fi
    done
}
search_machine() {
    echo "Searching for machines"
    for layer in "${layers[@]}"; do
        if (find "$layer/conf/machine" -name "*.conf" -type f | grep -q .) 2>/dev/null >/dev/null; then
            find "$layer/conf/machine" -name "*.conf" -type f
        fi
    done
}
search_image() {
    echo "Searching for images"
    for layer in "${layers[@]}"; do
        grep -nri "inherit .*image.*" "$layer" | grep -nE "(.bb:|.bbappend:)" --color=always
    done
}
# Use getopts to parse options
while getopts "dmih" opt; do
    case ${opt} in
    d) search_distro ;;
    m) search_machine ;;
    i) search_image ;;
    h)
        help
        exit 0
        ;;
    \?)
        echo "Invalid option: "
        help
        exit 1
        ;;
    esac
done
