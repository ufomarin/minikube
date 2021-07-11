
FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="grafana"
LABEL app_version=${grafana_version}
LABEL app_repository="https://dl.grafana.com/oss/release"

ENV grafana_version 7.5.6

RUN apk update && apk add libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-${grafana_version}.linux-amd64.tar.gz \
	&& tar -zxvf grafana-${grafana_version}.linux-amd64.tar.gz -C /etc/ \
	&& rm grafana-${grafana_version}.linux-amd64.tar.gz

COPY grafana.db /etc/grafana-7.5.6/data/

WORKDIR /etc/grafana-${grafana_version}/bin
EXPOSE 3000

CMD ["./grafana-server"]
