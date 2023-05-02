# Deploy an application

Deploy the application called atlas in the mercury project so that the following conditions are true:
- No configuration components have been added or removed
- The application produces output  



## First, you need to access the mercury project using the following command:
```shell
oc project mercury
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
## Check the events for any memory error:
```shell
oc get events | grep -i menory 
```
## Describe the application
```shell
oc describe dc atlas
```
following yaml will be resulted
```yaml
Name:		atlas
Namespace:	mercury
Labels:		app=atlas
		app.kubernetes.io/component=atlas
		app.kubernetes.io/instance=atlas
Annotations:	openshift.io/generated-by=OpenShiftNewApp
Latest Version:	2
Selector:	deploymentconfig=atlas
Replicas:	1
Triggers:	Config, Image(atlas@latest, auto=true)
Strategy:	Rolling
Template:
Pod Template:
  Labels:	deploymentconfig=atlas
  Annotations:	openshift.io/generated-by: OpenShiftNewApp
  Containers:
   atlas:
    Image:	registry.domainXX.example.com/openshift/hello-openshift@sha256:aaea76ff622d2f8bcb32e538e7b3cd0ef6d291953f3e7c9f556c1ba5baf47e2e
    Ports:	8080/TCP, 8888/TCP
    Host Ports:	0/TCP, 0/TCP
    Requests:
      memory:	80Gi
    Environment:
      RESPONSE:	<set to the key 'RESPONSE' of config map 'nasa'>	Optional: false
    Mounts:	<none>
  Volumes:	<none>
```
Change `80Gi` to `80Mi`
```shell
oc set resources dc atlas  --resources=memory=80Mi
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
deploying an application involves making sure that all the required resources and configurations are in place, setting appropriate resource limits, deploying the application, and verifying that it produces output. 