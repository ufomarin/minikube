# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nbirdper <nbirdper@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/13 17:28:36 by nbirdper          #+#    #+#              #
#    Updated: 2021/03/13 19:11:41 by nbirdper         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="phpMyAdmin"
LABEL app_version=${phpMyAdmin_version}
LABEL app_repository="https://files.phpmyadmin.net/phpMyAdmin"

ENV phpMyAdmin_version 5.0.4

RUN apk update && apk add nginx supervisor

RUN mkdir -p /run/nginx

RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
	php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath \
	php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc \
	php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session php7-mbstring

COPY ./supervisor.conf .

WORKDIR /var/www
RUN wget https://files.phpmyadmin.net/phpMyAdmin/${phpMyAdmin_version}/phpMyAdmin-${phpMyAdmin_version}-english.tar.gz

RUN tar -xvzf phpMyAdmin-${phpMyAdmin_version}-english.tar.gz \
	&& rm phpMyAdmin-${phpMyAdmin_version}-english.tar.gz \
	&& mv phpMyAdmin-${phpMyAdmin_version}-english phpmyadmin

COPY nginx_phpmyadmin.conf /etc/nginx/conf.d
COPY config.inc.php /var/www/phpmyadmin

EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/supervisor.conf"]
