FROM python:2.7.13-alpine
MAINTAINER ayubowContainer <bowwowxx@gmail.com>

ENV ETAG cat
ENV ECOUNT 5

COPY run_me.py /tmp
COPY flickr.py /tmp

WORKDIR /tmp
RUN mkdir -p /tmp/images
CMD /usr/local/bin/python ./run_me.py $ETAG $ECOUNT
