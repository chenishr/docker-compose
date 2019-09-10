FROM php:7.2.5-fpm-alpine3.7

ARG TZ=UTC
ARG PHP_TIMEZONE=UTC

ENV TZ $TZ

RUN apk update \
    && apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo "date.timezone=$PHP_TIMEZONE" > "$PHP_INI_DIR/conf.d/date-timezone.ini" \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk del .phpize-deps \
    && docker-php-ext-install mysqli pdo_mysql \
    && apk add --no-cache freetype libpng libjpeg-turbo \
    && apk add --no-cache --virtual .gd-deps-dev freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apk del .gd-deps-dev \
    && docker-php-ext-install opcache

CMD ["php-fpm"]
