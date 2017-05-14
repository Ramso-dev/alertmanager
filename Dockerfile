FROM prom/alertmanager 
ADD config.yml /etc/alertmanager/

CMD        [ "-config.file=/etc/alertmanager/config.yml", \
             "-storage.local.path=/alertmanager" ]