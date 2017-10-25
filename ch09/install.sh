#!/bin/bash
echo $MYSQL_NAME
sed -i 's/expose_php = On/expose_php = Off/' /etc/php5/apache2/php.ini
sed -i 's/allow_url_fopen = On/allow_url_fopen = Off/' /etc/php5/apache2/php.ini
a2enmod rewrite

wget --output-document=/etc/apache2/sites-enabled/000-default.conf https://raw.githubusercontent.com/bowwowxx/CIRCLE/dev/bowwo-fig/wordpress.conf --no-check-certificate
service apache2 restart


cd /tmp && wget http://wordpress.org/latest.tar.gz --no-check-certificate && tar xzvf latest.tar.gz wordpress
cd wordpress && cp wp-config-sample.php wp-config.php
sed -i 's/database_name_here/wordpress/' wp-config.php
sed -i 's/username_here/admin/' wp-config.php
sed -i 's/password_here/admin/' wp-config.php
sed -i 's/localhost/'"$MYSQL_NAME"'/' wp-config.php
rsync -avz --delete . /var/www/html

chown www-data:www-data -R /var/www/html/
service apache2 restart
