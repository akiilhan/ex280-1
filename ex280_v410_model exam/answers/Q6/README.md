# Configure limits

Configure your OpenShift cluster to use limits in the bluebook project with the following requirements:

-  The name of the LimitRange resource is: ex280-limits
-  The amount of memory consumed by a single pod is between 5Mi and 300Mi
-  The amount of memory consumed by a single container is between 5Mi and 300Mi with a default request value of 100Mi
-   The amount of CPU consumed by a single pod is between 10m and 500m
-   The amount of CPU consumed by a single container is between 10m and 500m with a default request value of 100m


## Create a YAML file named limit.yaml with the following content:
```shell
vim limit.yaml
```
```yaml
apiVersion: "v1"
kind: "LimitRange"
metadata:
  name: "ex280-limits"
spec:
  limits:
    - type: "Pod"
      max:
        cpu: "500m"
        memory: "300Mi"
      min:
        cpu: "10m"
        memory: "5Mi"
    - type: "Container"
      max:
        cpu: "500m"
        memory: "300Mi"
      min:
        cpu: "10m"
        memory: "5Mi"
      defaultRequest:
        cpu: "100m"
        memory: "100Mi"
```

## Run the following command to create the ex280-limits LimitRange resource and save it to the bluebook project:
```shell
oc create -f limit.yaml --save-config -n bluebook
```
## Verify that the LimitRange has been created by running the following command:
```shell
oc describe limitranges -n bluebook
```
## Conclusion

In summary, configuring limits for resources in an OpenShift cluster is important for efficient resource management and allocation. With the use of LimitRange resources, it is possible to set limits on the amount of memory and CPU consumed by pods and containers, thereby preventing resource exhaustion and ensuring better application performance.
