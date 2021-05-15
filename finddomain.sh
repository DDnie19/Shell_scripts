#!/bin/bash

read -p "Input Domain: " domain
wget www."$domain"

grep -o "[^/]*\."${domain%.*}"\."${domain##*.}"" index.html | sort -u > "$domain".txt

for url in $(cat "$domain".txt);do host "$url";done
