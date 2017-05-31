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

# Openshift: send outgoing mail test: <br />
*
-Use github cli to enable copy-paste
oc get pods
oc rsh _podname_

-Create body file:
vi test
mv test test.txt
sendmail -v -f from@mail.at -S smt.server.com auMyusername apMypassword -v < test.txt
example: sendmail -v -f fromsomeone@email.com -S smtp.google:587 auRamso apabcd1234 -v <test.text
