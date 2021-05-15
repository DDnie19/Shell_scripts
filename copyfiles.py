import os
#ffmpeg -i ~/Documents/rapid7-Offsec/pwk-91995-833763/media/video/AD_00_00.mp4 -vf subtitles=/home/d9/Desktop/pyTranscriber/AD_00_00.srt out.mp4

filePath = "/home/d9/Desktop/zh_srt/"
videoPath = "/home/d9/Documents/rapid7-Offsec/pwk-91995-833763-zh-chinese/media/video/"
lists_files = os.listdir(filePath)
count1 =0
count2 =0
count3 =0
trueNumber = 425
# print(lists_filee)
# while True:
try:
    for x in lists_files:
        if len(x) == 15:
            count1 +=1
            print("这是2个字的" + x[0:8])
            os.system('ffmpeg -i' +  ' ' + videoPath + x[0:8] + '.mp4' + ' ' + '-vf' + ' ' + 'subtitles=' + filePath + x[0:8] + '.zh.srt' + ' ' + x[0:8] + '.mp4')
        elif len(x) == 16:
            count2 +=1
            print("这是3个字的" + x[0:9])
            os.system('ffmpeg -i' +  ' ' + videoPath + x[0:9] + '.mp4' + ' ' + '-vf' + ' ' + 'subtitles=' + filePath + x[0:9] + '.zh.srt' + ' ' + x[0:9] + '.mp4')
        elif len(x) == 17:
            count3 +=1
            print("这是4个字的" + x[0:10])
            os.system('ffmpeg -i' +  ' ' + videoPath + x[0:10] + '.mp4' + ' ' + '-vf' + ' ' + 'subtitles=' + filePath + x[0:10] + '.zh.srt' + ' ' + x[0:10] + '.mp4')
        # if len(lists_files) == trueNumber:
            # print(len(lists_files))
            # print("***************************************************************************************************")
            # break
except EOFError as e:
    print(e)
    # continue
    # if len(lists_files) ==10:
        # break

max = count2+count1+count3
print("短标题生成：" + str(count1)) 
print("长标题生成：" + str(count2))
print("四标题生成：" + str(count3))
print("总共生成视频：" + str(max))