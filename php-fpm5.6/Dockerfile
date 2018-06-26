FROM index.alauda.cn/library/php:5-fpm
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng12-dev \
		gdb \
		strace \
		&& docker-php-ext-install -j$(nproc) iconv mcrypt mysqli mysql zip json bcmath pcntl \
		&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
		&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install -j$(nproc) pdo_mysql
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
# install xdebug
######################################

RUN curl -fsSL 'https://xdebug.org/files/xdebug-2.5.4.tgz' -o xdebug.tar.gz \
	&& mkdir -p xdebug \
	&& tar -xf xdebug.tar.gz -C xdebug --strip-components=1 \
	&& rm xdebug.tar.gz \
	&& ( \
			cd xdebug \
			&& phpize \
			&& ./configure --enable-xdebug \
			&& make -j$(nproc) \
			&& make install \
	   ) \
	&& rm -r xdebug \
	&& docker-php-ext-enable xdebug


RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
