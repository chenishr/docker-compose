FROM daocloud.io/library/php:7-fpm 
# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install iconv mcrypt pdo_mysql bcmath\
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

CMD ["php-fpm"]
