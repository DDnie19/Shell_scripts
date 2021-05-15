#!/bin/bash
find ./ -name "*.zh.srt" | while read -r files
do
	if [ "${#files}" -eq "18" ];then
	ffmpeg -nostdin -i home/d9/Documents/rapid7-offsec/pwk-91995-833763/media/video/"${files:2:9}".mp4 -vf subtitles="$files" "${files:2:9}".mp4
	elif [ "${#files}" -eq "17" ];then
	ffmpeg -nostdin -i /home/d9/Documents/rapid7-offsec/pwk-91995-833763/media/video/"${files:2:8}".mp4 -vf subtitles="$files" "${files:2:8}".mp4
	else
		echo "Errors!"
	fi
done
