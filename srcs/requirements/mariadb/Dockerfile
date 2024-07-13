FROM debian:bullseye


EXPOSE 3306

RUN apt update && apt upgrade -y

RUN apt-get install -y mariadb-server

RUN useradd mysqld

VOLUME /var/lib/mysql

WORKDIR /tmp

COPY tools/* .

RUN chmod +x setup.sh

ENTRYPOINT ["./setup.sh"]
