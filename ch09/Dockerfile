FROM  ubuntu:14.04
MAINTAINER ayubowContainer <bowwowxx@gmail.com>

ENV MYSQL_NAME=mysql

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8
    
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
    
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    apache2 \
    php5 \
    php5-mysql \
    wget \
    curl \
    nano \
    rsync \
    mysql-client

COPY install.sh /tmp  
    
RUN ./tmp/install.sh
    
EXPOSE 80    
CMD ["apache2ctl", "-D", "FOREGROUND"]