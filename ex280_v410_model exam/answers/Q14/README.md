# Deploy an application

Deploy the application called oranges in the apples project so that the following conditions are true:
- The application uses the ex280sa service account
- No additional configuration components have been added or removed
- The application produces output



## First, you need to access the apples project using the following command:
```shell
oc project apples
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
## deploy service account named `ex280sa` in `oranges` application:
```shell
oc set serviceaccount dc oranges ex280sa
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

## Check end point by following command:
```shell
oc describe svc oranges
```
Check `endpoints` is availble in svc
```shell
oc edit  svc oranges
```
Change "Selector:          deploymentconfig=orange" --> "Selector:          deploymentconfig=oranges"

```yaml
Name:              oranges
Namespace:         apples
Labels:            app=oranges
Annotations:       <none>
Selector:          deploymentconfig=orange
Type:              ClusterIP
IP:                172.30.236.171
Port:              http  8080/TCP
TargetPort:        8080/TCP
Endpoints:         <none>
Session Affinity:  None
Events:            <none>
```
to 
```yaml
Name:              oranges
Namespace:         apples
Labels:            app=oranges
Annotations:       <none>
Selector:          deploymentconfig=oranges
Type:              ClusterIP
IP:                172.30.236.171
Port:              http  8080/TCP
TargetPort:        8080/TCP
Endpoints:         10.128.0.10:8080,10.128.1.13:8080
Session Affinity:  None
Events:            <none>

```

## Conclusion
 configured a service account in the apples project with the name ex280sa and allowed pods to be run as any available user. We also edited the oranges service to update its selector to match the oranges deployment configuration.