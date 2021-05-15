#!/bin/bash
#for ip in $(cat pubLABmachineHTTP.txt.gnmap| grep 80 | grep -v "Nmap" | grep -v "UDP" | awk '{print $2}');do cutycapt --url=$ip --out=$ip.png ;done
echo "<HTML><BODY><BR>" > web.html

ls  *.png | awk -F : '{ print $1":\n<BR><IMG SRC=\""$1""$2"\" width=600><BR>"}' >> web.html

echo "</BODY></HTML>" >> web.html

