FROM alpine:latest as builder

ENV packUrl="https://gitee.com/Discuz/DiscuzX/attach_files/1773967/download"
RUN wget -O /srv/Discuz.zip "${packUrl}"

WORKDIR /srv
RUN unzip -q ./Discuz.zip

FROM php:8-apache
COPY --from=builder /srv/upload/ /var/www/html
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN set -eux; \
    chmod +x /usr/local/bin/install-php-extensions; \
    install-php-extensions \
    amqp \
    apcu \
    bcmath \
    bz2 \
    calendar \
    decimal \
    enchant \
    event \
    exif \
    gd \
    gettext \
    gmp \
    igbinary \
    intl \
    lzf \
    memcached \
    mongodb \
    msgpack \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    redis \
    sockets \
    swoole \
    tidy \
    timezonedb \
    uuid \
    xlswriter \
    xsl \
    yac \
    yaml \
    zip
