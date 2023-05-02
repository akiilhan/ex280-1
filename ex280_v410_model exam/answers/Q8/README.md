# Scale an application manually

Manually scale the minion application in the gru project to a total of 5 replicas.


## First get inside the project by following command:
```shell
oc project gru
```
## Check if the required resources are present in the project:
```shell
oc get pods
oc get service
oc get deployment
oc get dc
oc get route
oc get events
oc get all
```
## Manual Scaling with help command:
```shell
oc scale --help
oc scale --replicas=5 dc minion
```
## Verify resources are present in the project:
```shell
oc get pods
oc get service
oc get deployment
oc get dc
oc get route
oc get events
oc get all
```
## Conclusion
you can manually scale the minion application in the gru project to a total of 5 replicas using the oc scale command.