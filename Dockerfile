FROM prom/alertmanager
ADD config.yml /etc/alertmanager/config.yml

CMD        [ "-config.file=/etc/alertmanager/config.yml", \
             "-storage.path=/alertmanager" ]


