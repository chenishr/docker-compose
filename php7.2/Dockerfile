FROM daocloud.io/library/php:7-fpm 
# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
		imagemagick \
		libmagickwand-dev \
		libmagickcore-dev \
		mysql-client \
    && docker-php-ext-install iconv pdo_mysql bcmath zip pcntl opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

######################################
# install redis
######################################

COPY	./redis-3.1.5RC1.tgz /tmp/
RUN		cd /opt \
		&& tar -zxf /tmp/redis-3.1.5RC1.tgz \
			&& (\
				cd redis-3.1.5RC1 \
				&& /usr/local/bin/phpize \
				&& ./configure \
				&& make && make install \
			 )\
		&& rm /tmp/redis-3.1.5RC1.tgz \
		&& docker-php-ext-enable redis


######################################
# install imagick
######################################

COPY	./imagick-3.4.3.tgz /tmp/
RUN		cd /opt \
		&& tar -zxf /tmp/imagick-3.4.3.tgz \
			&& (\
				cd imagick-3.4.3 \
				&& /usr/local/bin/phpize \
				&& ./configure \
				&& make && make install \
			 )\
		&& rm /tmp/imagick-3.4.3.tgz \
		&& docker-php-ext-enable imagick

CMD ["php-fpm"]

# Possible values for ext-name:
# bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl json ldap mbstring mcrypt mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets spl standard sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip
