# Configure a service account

Configure a service account in the apples project to meet the following requirements:
- The name of the account is ex280sa
- The account allows pods to be run as any available user 



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
## Create a service account named `ex280sa` and make it available for any user:
```shell
oc create serviceaccount ex280sa
oc adm policy add-scc-to-user anyuid -z ex280sa
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
 configure a service account in the apples project that meets the requirements of allowing pods to be run as any available user. The steps involve creating a service account named ex280sa and adding the anyuid security context constraint to it