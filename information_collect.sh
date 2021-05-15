#!/bin/bash
# 利用bash的缝合特点，制作一个自动化被动和主动信息收集工具。
#域名信息，子域名信息，DNS解析记录，whois信息，traceroute信息icmp,icmp-type8，google搜索引擎
#
#
theHarvester="/home/d9/1self/Pentester_tools/information_collection/theHarvester/theHarvester.py"

#Status=$(curl -I -m 10 -o /dev/null -s -w %{http_code} www.google.com)
#echo "$Status"
#Google_status(){
#	if [ "$Status" == "200" ]  
#	then
#	return 0
#	else
#	echo "Network Errors!"
#	fi
#} 

#Google_status

echo "Enter target domain:" 
read -r domain


# while true
# do
echo "Your Target Domain is:" "$domain"
# done
	echo "Target domain set to $domain"
	echo "*******************************************"
	echo "The Harvestor" 
	$theHarvester -d $domain -l 500 -b all -f theHarvester_$domain 
	# echo "done!"
	echo "done"
#fi
#if [ "Goole_status" ]
#then
goofile -d "$domain" -f doc
#fi
#whois 
#dnsrecon -t std -d anicert.cn

