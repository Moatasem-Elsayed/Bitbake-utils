#!/bin/bash
recipe=$1
if [ -z "$1" ]; then
    exit 1
fi
# set -x
source bitbake-bblayers.sh
source bitbake-recipes.sh
layers=$(getbblayers)
read -ra layers <<<"$layers"
recipes=$(getrecipes "$recipe" "${layers[@]}")
read -ra recipes <<<$recipes
selected=$(gum choose "${recipes[@]}")
basename_recipe=$(basename "${selected%_*}")
diremeta=$(dirname "${selected#*/meta}")
# echo "$basename_recipe"
#echo "${diremeta}"
echo -e "\e[32m Select the layer to append the recipe\e[0m]"
target_layer=$(gum choose "${layers[@]}")
append_recipe="${target_layer}${diremeta}"/"${basename_recipe}"_%.bbappend
mkdir -p "${target_layer}"/"${diremeta}"
touch "$append_recipe"
echo 'FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"' >>"$append_recipe"

echo "Created ${append_recipe}"
