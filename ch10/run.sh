#! /bin/bash

echo ${BR:=2500k}
echo ${FPS:=29.970}
echo ${G:=60}
echo ${QUAL:="medium"}
echo ${URL:="rtmp://a.rtmp.youtube.com/live2"}
echo ${KEY:="xxx"}
echo ${FILE:="xx.mp4"}

ffmpeg \
    -i "$FILE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $G -b:v $BR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$URL/$KEY"
