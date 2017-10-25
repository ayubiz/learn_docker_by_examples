FROM  alpine:latest
MAINTAINER ayubowContainer <bowwowxx@gmail.com>

ENV POOL stratum+tcp://xmr-asia1.nanopool.org:14444
ENV ADDRESS 4BCeEPhodgPMbPWFN1dPwhWXdRX8q4mhhdZdA1dtSMLTLCEYvAj9QXjXAfF7CugEbmfBhgkqHbdgK9b2wKA6nqRZQCgvCDm
ENV PAYMENTID 8d0ce94a3d2409ef1be551c90bbef00f438122be501bc7d2099cde2b46b3677b
ENV WORKER $HOSTNAME
ENV THREADS 4

RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        automake \
        autoconf \
        openssl-dev \
        curl-dev \
        git \
        bash \
        build-base && \
        git clone https://github.com/OhGodAPet/cpuminer-multi && \
        cd cpuminer-multi && \
        autoreconf -i && \
        CFLAGS="-O3 -march=native" ./configure && \
        make && \
        apk del \
        automake \
        autoconf \
        build-base \
        git

ADD run.sh /cpuminer-multi/run.sh
WORKDIR    /cpuminer-multi

CMD chmod +x run.sh && ./run.sh