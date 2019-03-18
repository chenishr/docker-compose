FROM php:7.3.3-fpm-alpine3.9

ARG TZ=UTC
ARG PHP_TIMEZONE=UTC

ENV TZ $TZ

RUN apk update \
	    && apk add --no-cache tzdata \
	    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
	    && echo "date.timezone=$PHP_TIMEZONE" > "$PHP_INI_DIR/conf.d/date-timezone.ini" \
	    && apk add --no-cache --virtual .phpize-deps  $PHPIZE_DEPS \
	    && pecl install xdebug \
	    && docker-php-ext-enable xdebug \
	    && docker-php-ext-install mysqli pdo_mysql \
	    && apk add --no-cache freetype libpng libjpeg-turbo \
	    && apk add --no-cache --virtual .gd-deps-dev  linux-headers freetype-dev libpng-dev libjpeg-turbo-dev \
	    && docker-php-ext-configure gd \
	    --with-freetype-dir=/usr/include/ \
	    --with-png-dir=/usr/include/ \
	    --with-jpeg-dir=/usr/include/ \
	    && docker-php-ext-install -j$(nproc) gd \
	    && docker-php-ext-install opcache \
	    && wget -O /usr/src/redis_4.3.0.tar.gz https://github.com/phpredis/phpredis/archive/4.3.0.tar.gz \
	    && tar -zxf /usr/src/redis_4.3.0.tar.gz -C /usr/src/ \
	    && ( \
			    cd /usr/src/phpredis-4.3.0 \
			    && /usr/local/bin/phpize \
			    && ./configure --with-php-config=/usr/local/bin/php-config \
			    && make \
			    && make install \
	       ) \
	    && rm /usr/src/redis_4.3.0.tar.gz \
	    && rm -rf /usr/src/phpredis-4.3.0 \
	    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/docker-php-ext-redis.ini \
	    && wget -O /usr/src/swoole_4.3.1.tar.xz https://github.com/swoole/swoole-src/archive/v4.3.1.tar.gz \
	    && tar -zxf /usr/src/swoole_4.3.1.tar.xz -C /usr/src/ \
	    && ( \
			    cd /usr/src/swoole-src-4.3.1 \
			    && /usr/local/bin/phpize \
			    && ./configure --with-php-config=/usr/local/bin/php-config \
			    && make \
			    && make install \
	       ) \
	    && rm /usr/src/swoole_4.3.1.tar.xz \
	    && rm -rf /usr/src/swoole-src-4.3.1 \
	    && echo "extension=swoole.so" > /usr/local/etc/php/conf.d/docker-php-ext-swoole.ini

RUN apk del .phpize-deps \
    && apk del .gd-deps-dev 

CMD ["php-fpm"]
