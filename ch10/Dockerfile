FROM ubuntu:trusty
MAINTAINER ayubowContainer <bowwowxx@gmail.com>

ENV BR 2500k
ENV FPS 29.970
ENV QUAL medium
ENV URL rtmp://a.rtmp.youtube.com/live2
ENV KEY xxkey
ENV FILE xx.mp4

RUN apt-get -y update && apt-get -y dist-upgrade && \
    apt-get install -y --no-install-recommends \
 	python-software-properties \
 	software-properties-common && \
 	add-apt-repository -y ppa:kirillshkrogalev/ffmpeg-next && apt-get -y update && \
 	apt-get -y install ffmpeg
    

RUN mkdir -p /tmp/images

WORKDIR /tmp

ADD run.sh /tmp/run.sh

CMD ./run.sh
