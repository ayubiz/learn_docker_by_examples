FROM mysql:5.5
MAINTAINER ayubowContainer <bowwowxx@gmail.com>

COPY docker-entrypoint.sh /usr/local/bin/
RUN rm -r /entrypoint.sh && ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
