# Scale an application automatically

Automatically scale the hydra application deployment configuration in the lerna project with the following requirements:
- Minimum number of replicas: 6
- Maximum number of replicas: 9
- Target average CPU utilization: 60 percent
- Container CPU resource request: 25m
- Container CPU resource limit: 100m



## First, you need to access the Lerna project using the following command:
```shell
oc project lerna
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
## Auto Scaling with help command:
```shell
oc autoscale  --help
oc autoscale dc hydra --max=9 --min=6  --cpu-percent=60
```

## Scale the Container CPU resource with help command:
```shell
oc set resources --help
oc set resources dc hydra --limits=cpu=100m --requests=cpu=25m
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
automatically scaling the Hydra application deployment configuration in the Lerna project involves setting a minimum and maximum number of replicas, target average CPU utilization, and container CPU resource request and limit. The process can be achieved through the use of the oc autoscale and oc set resources commands, 