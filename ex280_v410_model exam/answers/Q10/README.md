# Configure a secure route

Configure the oxcart application in the area51 project with the following requirements:
- The application uses a route called oxcart
- The application uses a CA signed certificate with the following subject fields:
- /C=US/ST=NV/L=Hiko/O=CIA/OU=USAF/CN=classified.apps.domainXX.example.com
- The application is reachable only at the following address:
- https://classified.apps.domainXX.example.com
- The application produces output

- A utility script called newcert has been provided to create the CA signed certificate. You may enter the certificate parameters manually or pass the subject as a parameter.
- Your certificate signing request will be uploaded to the CA where it will immediately be signed and then downloaded to your current directory.


## First, you need to access the area51 project using the following command:
```shell
oc project area51
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
## Delete the exisiting route command:
```shell
oc delete route oxcart
```

## Generate key and cerificate `manually` help command:
```shell
openssl genrsa -out ex280.key 2048
openssl req -new -key ex280.key -out ex280.csr -subj "/C=US/ST=NV/L=Hiko/O=CIA/OU=USAF/CN=classified.apps.domainXX.example.com" 
openssl x509 -req -in ex280.csr -signkey ex280.key -out ex280.crt
```
## `OR` Generate key and cerificate with the help of newcert application given in exam:
```shell
newcert
```
Expose the oxcart service at https://classified.apps.domainxx.example.com with key and certificate
```shell
oc create route edge oxcart --service oxcart --key ex280.key --cert ex280.crt --hostname classified.apps.domainxx.example.com
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
configure a secure route for the oxcart application in the area51 project with the specified requirements, you need to generate a key and a certificate with OpenSSL or using the newcert application provided in the exam.