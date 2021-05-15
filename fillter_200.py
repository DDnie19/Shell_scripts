import csv
import sys , os

Domain = sys.argv
Domain_result = "/home/d9/1self/Pentester_tools/Web_Tools/OneForAll/results"
Rad_spider_Path = "/home/d9/1self/Pentester_tools/Web_Tools/LSpider/xray_scanner/"


with open(Domain_result + '/' + str(Domain[1]) + '.csv', newline='') as csvfile, \
    open(Domain_result + '/' + str(Domain[1]) + '.txt', 'w') as Newfile:
    try:
        reader = csv.DictReader(csvfile)
        count = 0
        for row in reader:
            if row['status'] == '200':
                count += 1
                Newfile.write(row['url'] + '\n')
                os.system(Rad_spider_Path + 'rad_linux_amd64 --http-proxy 127.0.0.1:7777 -t' + " " + row['url'])
        print("URL status == 200 count:" + str(count))
        # Newfile.close()
        # csvfile.close()
    except EOFError as e:
        print(e)

# Domain_result_url = Domain_result + '/' + str(Domain[1]) + '.txt'
# for x in Domain_result_url:
#     print(x)

