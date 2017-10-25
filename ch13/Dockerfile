FROM ubuntu:14.04
MAINTAINER ayubowContainer <bowwowxx@gmail.com>

# set ubuntu to noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y xorg lxde-core lxterminal tightvncserver && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 5901
WORKDIR /root

CMD ["bash"]