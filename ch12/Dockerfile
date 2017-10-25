FROM ubuntu:14.04
MAINTAINER ayubowContainer <bowwowxx@gmail.com>

RUN apt-get update && apt-get -y install cron nodejs nodejs-legacy
RUN apt-get -y install npm curl nano
RUN npm install elasticdump -g

# which causes "tail: unrecognized file system type 0x794c7630 for '/tmp/log/cron.log'"
VOLUME /tmp/log/

ADD cron.log /tmp/log/cron.log
ADD sync.sh /usr/bin/sync.sh
RUN chmod +x /usr/bin/sync.sh

ADD crontab /etc/cron.d/els-cron
RUN chmod 0644 /etc/cron.d/els-cron
RUN touch /tmp/log/cron.log
ENTRYPOINT cron && tail -f /tmp/log/cron.log