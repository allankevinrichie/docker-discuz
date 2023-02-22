FROM alpine:latest as builder

ADD Discuz_X3.5_SC_UTF8_20230210.zip /srv/Discuz.zip
WORKDIR /srv
RUN unzip -q ./Discuz.zip

FROM php:8-apache
COPY --from=builder /srv/upload/ /var/www/html
RUN docker-php-ext-install mysqli
