# Deploy an application

Deploy the application called voyager in the pathfinder project so that the following conditions are true:
- No configuration components have been added or removed
- The application produces output  



## First, you need to access the pathfinder project using the following command:
```shell
oc project pathfinder
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
## Check the worker node by command:
```shell
oc describe  node worker0.domain2.example.com
```
following yaml will be resulted
```yaml
Name:               worker0.domainXX.example.com
Roles:              worker
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=worker0.domainXX.example.com
                    kubernetes.io/os=linux
                    node-role.kubernetes.io/worker=
                    node.openshift.io/os_id=rhcos
                    star=trek
Annotations:        machineconfiguration.openshift.io/controlPlaneTopology: HighlyAvailable
                    machineconfiguration.openshift.io/currentConfig: rendered-worker-a43dea2cdc8ee25f6cac55211539c197
                    machineconfiguration.openshift.io/desiredConfig: rendered-worker-a43dea2cdc8ee25f6cac55211539c197
                    machineconfiguration.openshift.io/reason: 
                    machineconfiguration.openshift.io/state: Done
                    volumes.kubernetes.io/controller-managed-attach-detach: true
```
Change `star=trek` in node level by:
```shell
oc label node worker0 star=trek --overwrite
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
checked if the required resources were present in the project, and verified that the worker node was properly labeled. Finally, we changed the label of the star attribute on the worker0 node using the oc label command with the --overwrite flag. It's important to carefully plan and understand the impact of such changes, as they can affect the scheduling of pods and the allocation of resources in the cluster.