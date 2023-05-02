# Deploy an application

Deploy the application called rocky in the bullwinkle project so that the following conditions are true:

- The application is reachable at the following address:
- http://rocky.apps.domainXX.example.com
- The application produces output

## First get inside the project by following command:
```shell
oc project bullwinkle
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
## Check which nodes have been tainted:
```shell
oc describe node | grep -i taint
```
## To remove the taint from node by running the help command:
```shell
oc adm taint nodes --help
```
Select the suitable example 
```shell
oc adm taint nodes worker0 key1=value1:NoSchedule-
oc adm taint nodes worker1 key1=value1:NoSchedule-
```
This removes the key1=value1:NoSchedule taint from the worker0 node. You may need to run this command on all tainted nodes.


check taint is removed or not 
```shell
oc describe node | grep -i taint
```
## application produces output at given link
Delete any existing default route for the rocky service:
```shell
oc delete routes rocky
```
Expose the rocky service at http://rocky.apps.domainXX.example.com:
```shell
oc expose service rocky --hostname=rocky.apps.domainXX.example.com
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