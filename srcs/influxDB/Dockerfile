
FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app2="influxDB"
LABEL app="telegraf"
LABEL app_version=${telegraf_version}
LABEL app_repository="https://github.com/influxdata/telegraf/releases"

ENV telegraf_version 1.18.2

RUN apk update && apk add libc6-compat

RUN apk add influxdb supervisor

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-${telegraf_version}_linux_amd64.tar.gz \
    && tar xf telegraf-${telegraf_version}_linux_amd64.tar.gz -C /etc/ \
    && rm telegraf-${telegraf_version}_linux_amd64.tar.gz \
    && mv /etc/telegraf-${telegraf_version} /etc/telegraf

COPY ./supervisor.conf .

WORKDIR /etc/telegraf/usr/bin
RUN ./telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf
WORKDIR /

EXPOSE 8086

CMD ["/usr/bin/supervisord", "-c", "/supervisor.conf"]
