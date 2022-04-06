#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

value=$1
array=("nvidia" "integrated" "hybrid")
path="/etc/optimus-manager/optimus-manager.conf"

if [[ -z $value ]]; then 
    echo "Usage: \$ switch_graphics MODE [${array[*]}]"
    exit 1
fi

if [[ ! " ${array[*]} " =~ " ${value} " ]]; then
    echo "mode must be one of: ${array[*]}"
    exit 1
fi

if [[ " ${array[*]} " =~ " ${value} " ]]; then
    sed -i 's/startup_mode=\(nvidia\|hybrid\|integrated\)/startup_mode='"$value"'/' $path
    echo "restart to switch to ${value} mode"
    exit 0
fi

