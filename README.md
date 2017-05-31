# Alertmanager in Openshift:<br />

working dockerfile file is prom/alertmanager. I wasnt able to prepare a working docker file with custom config.It doesn't overwrite the original one. In order to update the config mount the volume /etc/alertmanager with the config map. <br />

# OC console:<br />
oc create -f https://raw.githubusercontent.com/Ramso-dev/alertmanager/master/config.yml<br />
oc volume dc/alertmanager --add --name=alert8 -m /etc/alertmanager -t configmap --configmap-name=alert8<br />

# to update it you have to remove the old configmap before:<br />
oc delete configmap alert8<br />
oc volume dc/alertmanager --remove --name=alert8<br />

# check configmap contents:<br />
oc get configmap -o json<br />

# Issues:<br />
Now working in Openshift xxxxx.itxxxx.at:25. It wasn't working locally because the firewall configuration was blocking the requests.
Gmail and office in port 587 didn't work because looks like the ports are not open in our openshift
