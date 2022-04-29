#!/bin/bash

cur() {
    brightnessctl -d "intel_backlight" | sed '2q;d' | awk '{print $4}' | awk '{print substr($0, 2, length($0)-2)}'
}

inc() {
    brightnessctl -d "intel_backlight" s +$1% -q
}

dec() {
    brightnessctl -d "intel_backlight" s $1%- -q
}

usage() {
    echo "USAGE: user@machine> brightness.sh [*cur|inc amt|dec amt]"
}

if [[ "$1" == "cur" || "$1" == "" ]]; then
    cur
elif [[ "$1" == "inc" && ! -z $2 ]]; then
    inc $2
elif [[ "$1" == "dec" && ! -z $2 ]]; then
    dec $2
elif [[ "$1" == "-h" || "$1" == "help" ]]; then
    usage
else
    usage
fi
