#!/bin/bash

cur() {
    amixer sget Master | sed '5q;d' | awk '{print $4}' | awk '{print substr($0, 2, length($0)-2)}'
}

inc() {
    amixer sset Master $1%+ -q
}

dec() {
    amixer sset Master $1%- -q
}

usage() {
    echo "USAGE: user@machine> volume.sh [*cur|inc amt|dec amt]"
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
