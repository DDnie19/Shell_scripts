#!/bin/bash
onePath="/home/d9/1self/Pentester_tools/Web_Tools/OneForAll"
for i in "$*"; do
    ip=$(cat "$i")
    echo "$ip"
    list_ip=("$ip")
    length=${#list_ip[@]}
    echo "$length"
    for (( n=0; n<${length}; n++ ));
    do
        if [[ "${list_ip[$n]}" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then   
            zoomeye search "${list_ip[$n]}" 
            echo "${list_ip[$n]} is search done"
        #else
        #    python3 "$onePath"/oneforall.py --target "${list_ip[$n]}" run
        #    echo "${list_ip[$n]} Domain is search done"
            fi
    sleep 1
    done
    done