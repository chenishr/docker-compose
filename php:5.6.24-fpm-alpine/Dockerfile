FROM php:5.6.24-fpm-alpine

ARG TZ=UTC
ARG PHP_TIMEZONE=UTC

ENV TZ $TZ

RUN apk update \
	    && apk add --no-cache tzdata \
	    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
	    && echo "date.timezone=$PHP_TIMEZONE" > "$PHP_INI_DIR/conf.d/date-timezone.ini" \
	    && apk add --no-cache --virtual .phpize-deps  $PHPIZE_DEPS \
	    && docker-php-ext-install mysqli pdo_mysql \
	    && apk add --no-cache freetype libpng libjpeg-turbo coreutils libltdl  libssh2 \
	    && apk add --no-cache --virtual .gd-deps-dev  linux-headers freetype-dev libpng-dev libjpeg-turbo-dev libssh2-dev \
	    && docker-php-ext-configure gd \
	    --with-freetype-dir=/usr/include/ \
	    --with-png-dir=/usr/include/ \
	    --with-jpeg-dir=/usr/include/ \
	    && docker-php-ext-install -j$(nproc) gd \
	    && docker-php-ext-install opcache \
	    && pecl install -o -f redis \
	    &&  docker-php-ext-enable redis \
	    && pecl install -o -f ssh2 \
	    &&  docker-php-ext-enable ssh2 \
	    &&  rm -rf /tmp/pear 

CMD ["php-fpm"]
