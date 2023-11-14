#!/usr/bin/env bash
# shellcheck disable=SC1090,SC1091,SC2015

# Get the general docs file regex.
function getGeneralConfigsFileRegex() {
    echo '.*\.(yaml|yml|json)$'
}

function getGeneralConfigsFileGlob() {
    echo '**/*.{yaml,yml,json}'
}
