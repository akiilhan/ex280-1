# Configure a secret

Configure a secret in the math project with the following requirements:
- The name of the secret is: magic
- The secret defines a key with name: decoder_ring
- The secret defines the key with value: XpWy9KdcP3Tr9FFHGQgZgVRCKukQdrQsbcl0c2ZYhDk=




## First, you need to access the math project using the following command:
```shell
oc project math
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
## Create the secret magic with the given key-value pair:
```shell
oc get secret 
oc create secret generic magic --from-literal key=decoder_ring --from-literal value=XpWy9KdcP3Tr9FFHGQgZgVRCKukQdrQsbcl0c2ZYhDk= -n math
```
## Verify that the secret has been created:
```shell
oc get secret -n math
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
created the secret magic with the given key-value pair using the oc create secret command