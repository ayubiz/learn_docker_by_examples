FROM  alpine:latest
MAINTAINER ayubowContainer <bowwowxx@gmail.com>

RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        openssl-dev \
        nano git bash \
        gcc make cmake g++ zlib-dev && \
        git clone https://github.com/fireice-uk/xmr-stak-cpu.git && \
        cd /xmr-stak-cpu && \
        sed -i -e 's/2.0/0.0/g' donate-level.h && \
        cmake -DHWLOC_ENABLE=OFF -DMICROHTTPD_ENABLE=OFF . && \
        make install 

ADD config.txt /xmr-stak-cpu/bin/config.txt
WORKDIR    /xmr-stak-cpu/bin

CMD ./xmr-stak-cpu
