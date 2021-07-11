FROM	alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="vsftpd"

RUN		apk update && apk add openssl vsftpd

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj "/C=RU/ST=Republic of Tatarstan/L=Kazan/O=School21/OU=21Kazan/CN=nbirdper" \
-keyout /etc/ssl/private/ftps-selfsigned.key \
-out /etc/ssl/certs/ftps-selfsigned.crt;

COPY	vsftpd.conf /etc/vsftpd/
COPY	start_ftps.sh tmp/
EXPOSE	21 20

CMD		["sh", "tmp/start_ftps.sh"]