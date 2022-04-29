#!/bin/bash

function acpiline() {
    l0=$(llevel 1)
    l1=$(llevel 2)
    if [[ -z $l1 || "$l0" > "$l1" ]]; then
        echo 1
    else
        echo 2
    fi
}

function llevel() {
    acpi -b | sed -n $1p | awk '{print substr($4, 1, length($4)-1)}'
}

function sstatus() {
    acpi -b | sed -n $1p | awk '{print substr($3, 1, length($3)-1)}'
}

function level() {
    llevel $(acpiline)
}

function status() {
    sstatus $(acpiline)
}

function usage() {
    echo "USAGE: user@machine> battery.sh [*level|status|info]"
}

if [[ "$1" == "level" || "$1" == "" ]]; then
    level
elif [[ "$1" == "info" ]]; then
    echo $(status) $(level)
elif [[ "$1" == "status" ]]; then
    status
elif [[ "$1" == "-h" || "$1" == "help" ]]; then
    usage
else
    usage
fi
