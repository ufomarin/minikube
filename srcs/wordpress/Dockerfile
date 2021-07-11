# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nbirdper <nbirdper@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/13 17:28:21 by nbirdper          #+#    #+#              #
#    Updated: 2021/05/10 22:18:04 by nbirdper         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="wordpress"
LABEL app_version=${wordpress_version}
LABEL app_repository="https://wordpress.org/"

ENV wordpress_version 5.7.2

RUN apk update && apk add nginx supervisor

RUN mkdir -p /run/nginx

RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
	php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath \
	php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc \
	php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session php7-mbstring

COPY ./supervisor.conf .
WORKDIR /var/www
RUN wget https://wordpress.org/wordpress-${wordpress_version}.tar.gz
RUN tar -xvzf wordpress-${wordpress_version}.tar.gz && rm -rf wordpress-${wordpress_version}.tar.gz

COPY nginx_wp.conf /etc/nginx/conf.d
COPY ./wp-config.php /var/www/wordpress

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/supervisor.conf"]
