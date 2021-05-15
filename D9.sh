#/bin/bash
###实现目标
#1.输入域名进行子域名爆破，将爆破出来的数据进行分类，将每一个域名进行dns解析成IP地址。
#如果输入是IP地址跳过dns解析和子域名爆破。
#2.对每一个IP地址进行nmap端口扫描，将发现的子域名，IP，nmap扫描结果生成表格。bash+python脚本
#3.将每一个web站点进行常用目录快速head爆破，针对每一个爆破结果和子域名web站点进行关联输出表格。
#
# #OneForAll= echo '/home/d9/self/tools/OneForAll'
# #print $OneForAll
scan_file_name=$(date | cut -b 16-25)

echo "Enter Your Domain Name:"
read domain_name
echo "Your Domain Name is: $domain_name"
sleep 3

python3 /home/d9/self/tools/OneForAll/oneforall.py --target $domain_name run
sleep 5
sub_domain_name=$(gawk -F ',' '{print $8}' \
/home/d9/self/tools/OneForAll/results/$domain_name.csv  | sed 1d )

printf "%s\n"  $sub_domain_name > $scan_file_name

# echo $dire > $scan_file_name
# printf "%s\n" $dire  > $scan_file_name
# printf "%s\n" $dire
nmap -Pn -sS --top-ports 5000 -g 80 --script http-enum \
--script-args http.useragent=\
"Mozilla/5.0; Baiduspider/2.0; +http://www.baidu.com/search/spider.html" \
$sub_domain_name  -vvvv  --dns-servers 8.8.8.8 -oX $scan_file_name
# test=/home/d9/self/07:53:52
#
# python3 /home/d9/self/tools/dirsearch/dirsearch.py -L $scan_file_name -e * \
# --plain-text-report=PLAINTEXTOUTPUTFILE
