FROM prom/alertmanager
ADD simple.yml /etc/alertmanager/simple.yml

CMD        [ "-config.file=/etc/alertmanager/simple.yml", \
             "-storage.path=/alertmanager" ]


