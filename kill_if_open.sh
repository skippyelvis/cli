#!/bin/bash
pids () {
    proc=$1
    proc=[${proc:0:1}]${proc:1}
    pids=$(ps aux | grep -i ${proc} | awk '{print $2}')
    echo $pids
}

out=$(pids $1)
kill -9 ${out%% *}
