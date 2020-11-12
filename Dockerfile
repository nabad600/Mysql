FROM alpine:3.12

LABEL MAINTAINER Naba Das <nabad600@gmail.com>

RUN apk add --no-cache mariadb && \
    addgroup mysql mysql && \
    mkdir /run/mysqld && \
    chown mysql:mysql /etc/my.cnf.d/ /run/mysqld
COPY resolveip.sh /usr/bin/resolveip
COPY start.sh /start.sh
COPY my.cnf /etc/my.cnf.d/

VOLUME [ "/var/lib/mysql" ]
ENTRYPOINT [ "/start.sh" ]
EXPOSE 3306