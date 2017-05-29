Alertmanager in Openshift:

working dockerfile file is prom/prometheus. I wasnt able to prepare a working docker file with custom config. The only way i managed to update the config is mounting a volume with a config map.

OC console:
oc create -f https://raw.githubusercontent.com/Ramso-dev/alertmanager/master/config.yml
oc volume dc/alertmanager --add --name=alert8 -m /etc/alertmanager -t configmap --configmap-name=alert8

to update it you have to remove the old configmap before:
oc delete configmap alert8
oc volume dc/alertmanager --remove --name=alert8

check configmap contents:
oc get configmap -o json