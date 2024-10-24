FROM alpine:latest as builder

ENV packUrl="https://gitee.com/Discuz/DiscuzX/attach_files/1773967/download"
RUN wget -O /srv/Discuz.zip "${packUrl}"

WORKDIR /srv
RUN unzip -q ./Discuz.zip

FROM php:8-apache
COPY --from=builder /srv/upload/ /var/www/html
RUN docker-php-ext-install mysqli
