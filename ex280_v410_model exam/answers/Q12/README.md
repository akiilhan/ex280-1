# Configure an application to use a secret

Configure the application called qed in the math project with the following requirements:
- The application uses the secret previously created called: magic
- The secret defines an environment variable with name: DECODER_RING
- The application output no longer displays: Sorry, application is not configured correctly.




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
## Deploy the secret in the application:
```shell
oc set env --help
oc set env --from=secret/magic dc qed
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
 configure an application to use a secret in OpenShift. Specifically, you configured the "qed" application in the "math" project to use the "magic" secret, This was achieved by using the "oc set env" command to deploy the secret and set the environment variable in the deployment configuration.