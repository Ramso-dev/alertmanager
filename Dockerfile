FROM prom/alertmanager
ADD simple.yml /etc/alertmanager/

CMD        [ "-config.file=/etc/alertmanager/simple.yml", \
             "-storage.path=/alertmanager" ]


