FROM alpine:latest as builder

ADD Discuz_X3.4_SC_UTF8_20210816.zip /srv/Discuz.zip
WORKDIR /srv
RUN unzip -q ./Discuz.zip

FROM ztj1993/website-php5:latest
COPY --from=builder /srv/upload/ /var/www/localhost/htdocs
RUN rm -f /var/www/localhost/htdocs/index.html
