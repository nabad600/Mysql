FROM alpine:latest

COPY ./docker-entrypoint.sh /

RUN addgroup -S mysql \
    && adduser -S mysql -G mysql \
    && apk add --no-cache mysql mysql-client \
    && mkdir /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && chmod -R 777 /run/mysqld
RUN chmod 777 /docker-entrypoint.sh
EXPOSE 3306
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld", "--user=mysql"]
