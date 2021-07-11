# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nbirdper <nbirdper@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/12 22:10:43 by nbirdper          #+#    #+#              #
#    Updated: 2021/05/11 01:02:15 by nbirdper         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="mariadb"

RUN apk update

RUN apk add mariadb mariadb-client openrc

COPY ./start_db.sh .
COPY ./wordpress.sql .

CMD ["sh", "start_db.sh"]
