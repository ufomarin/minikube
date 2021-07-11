# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nbirdper <nbirdper@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/12 15:36:07 by nbirdper          #+#    #+#              #
#    Updated: 2021/03/13 19:10:56 by nbirdper         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="nginx"

RUN apk update && apk add nginx

RUN mkdir -p /run/nginx

RUN apk add openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj "/C=RU/ST=Republic Tatarstan/L=Kazan/O=21School/OU=21Kazan/CN=nbirdper" \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt;

COPY ./default.conf /etc/nginx/conf.d/

EXPOSE 80 443

CMD  ["nginx", "-g", "daemon off;"]
