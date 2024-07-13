FROM debian:bullseye

EXPOSE 443

RUN apt update && apt upgrade -y

RUN apt install openssl nginx -y

WORKDIR /etc/nginx/certs

COPY ./tools/script.sh /

RUN chmod +x script

CMD [ "/script.sh" ]

