# Scale an application manually

Manually scale the minion application in the gru project to a total of 5 replicas.

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
deploy the rocky application in the bullwinkle project and make it reachable at http://rocky.apps.domainXX.example.com, we need to ensure that all the required resources are present in the project, remove any taints from the nodes (if needed), delete any existing default route for the rocky service, and expose the service at the specified hostname. 