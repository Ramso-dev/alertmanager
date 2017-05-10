FROM golang:1.5.3 
MAINTAINER The Prometheus Authors <prometheus-developers@googlegroups.com> 
WORKDIR /go/src/github.com/prometheus/alertmanager
COPY    . /go/src/github.com/prometheus/alertmanager

RUN apt-get install make \
    && make build \
    && cp alertmanager /bin/ \
    && mkdir -p /etc/alertmanager/template \
    && mv ./doc/examples/config.yml /etc/alertmanager/config.yml \
    && rm -rf /go
ADD simple.yml /etc/alertmanager/simple.yml
EXPOSE 9093 
VOLUME     [ "/alertmanager" ]
WORKDIR    /alertmanager
ENTRYPOINT [ "/bin/alertmanager" ]
CMD        [ "-config.file=/etc/alertmanager/simple.yml", \
             "-storage.path=/alertmanager" ]