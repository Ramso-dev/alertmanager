FROM        prom/busybox:latest
MAINTAINER  The Prometheus Authors <prometheus-developers@googlegroups.com>

COPY alertmanager               /bin/alertmanager
ADD simple.yml    /etc/alertmanager/config.yml

EXPOSE     9093
VOLUME     [ "/alertmanager" ]
WORKDIR    /alertmanager
ENTRYPOINT [ "/bin/alertmanager" ]
CMD        [ "-config.file=/etc/alertmanager/config.yml", \
"-storage.path=/alertmanager" ]