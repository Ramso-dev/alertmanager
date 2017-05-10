FROM golang:1.5.3 
MAINTAINER The Prometheus Authors <prometheus-developers@googlegroups.com> WORKDIR /go/src/github.com/prometheus/alertmanager
COPY    . /go/src/github.com/prometheus/alertmanager
ADD simple.yml /etc/alertmanager/
RUN apt-get install make \
    && make build \
    && cp alertmanager /bin/ \
    && mkdir -p /etc/alertmanager/template \
    && mv ./doc/examples/simple.yml /etc/alertmanager/simple.yml \
    && rm -rf /go
EXPOSE 9093 VOLUME     [ "/alertmanager" ]
WORKDIR    /alertmanager
ENTRYPOINT [ "/bin/alertmanager" ]
CMD        [ "-config.file=/etc/alertmanager/simple.yml", \
             "-storage.path=/alertmanager" ]