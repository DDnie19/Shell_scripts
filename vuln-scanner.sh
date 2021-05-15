#!/bin/bash

WebToolsPath="/home/d9/1self/Pentester_tools/Web_Tools/"
ScriptsPath="/home/d9/1self/Pentester_tools/self_little_scripts/2.bash/"

echo "Enter Your Domain:" 
read -r Domain

echo "Your Domain is:" "$Domain"

if [ ! -f "$WebToolsPath"OneForAll/results/"$Domain".csv ]; then
  echo "子域名结果不存在！！！"
  echo "***************收集子域名****************************************************"
  cd "$WebToolsPath"OneForAll/ || exit
  git pull
  echo "***************OneForAll Update !!****************************************************"
  python3 "$WebToolsPath"OneForAll/oneforall.py --target "$Domain" run
fi
if [ ! -f "$WebToolsPath"OneForAll/results/"$Domain".txt ]; then
  python3 "$ScriptsPath"fillter_200.py "$Domain"
  else
  echo "子域名结果存在，进行Rad爬取和XRAY扫描！！！" 
  cat "$WebToolsPath"OneForAll/results/"$Domain".txt
fi


echo "***************************************************************************"
echo "***************收集状态200的域名*********************************************"

echo "***************Rad+XRAY-webscanner*****************************************"