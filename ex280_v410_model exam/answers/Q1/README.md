# Configure an identity provider
## Configure your OpenShift cluster to use an HTPasswd identity provider with the following requirements:
- The name of the identity provider is: ex280-htpasswd
- The name of the secret is: ex280-idp-secret
- The user account armstrong=indionce
- The user account collins=veraster
- The user account aldrin=roonkere
- The user account jobs=sestiver
- The user account wozniak=glegunge

## Create a textfile loke "vim mypass.txt" and `Source` the mypass.txt file to set the environment variables:
```shell
source mypass.txt
```
## Log in to your OpenShift cluster as a user with administrator privileges:
```shell
oc login -u kubeadmin -p ${kube_pass} ${api_url} 
```
## To Create an `HTPasswd file` for the users, use the following command:

```shell
htpasswd -c -B -b </path/to/users.htpasswd> <user_name> <password>
```
Run the following command to create the file named htpasswd-file:
```shell
htpasswd -c -B -b htpasswd-file armstrong indionce
htpasswd    -B -b htpasswd-file collins veraster
htpasswd    -B -b htpasswd-file aldrin roonkere
htpasswd    -B -b htpasswd-file jobs sestiver
htpasswd    -B -b htpasswd-file wozniak glegunge
```
## Create a `secret` from the `htpasswd-file`:
```shell
oc create secret generic htpass-secret --from-file=htpasswd=<path_to_users.htpasswd> -n openshift-config
```
Create a secret named `ex280-idp-secret`
```shell
oc create secret generic ex280-idp-secret --from-file htpasswd=htpasswd-file -n openshift-config 
```
## Download a copy of the `oauth/cluster` resource from your OpenShift cluster:
```shell
oc get oauth/cluster -o yaml> oauth.yaml
```
## `Edit the oauth.yaml` file and replace the spec.identityProviders section with the following content:
```yaml
spec:
  identityProviders:
  - name: ex280-htpasswd
    mappingMethod: claim
    type: HTPasswd
    htpasswd:
      fileData:
        name: ex280-idp-secret
```
## Replace the oauth/cluster resource with the modified oauth.yaml file:
```shell
oc replace  -f oauth.yaml
```
## (Optional) Create aliases for quick `login as each user`:
```shell
alias _kube="oc login -u kubeadmin -p ${kube_pass} ${api_url}"
alias _armstrong="oc login -u armstrong -p ${armstrong} ${api_url}"
alias _collins="oc login -u collins -p ${collins} ${api_url}"
alias _aldrin="oc login -u aldrin -p ${aldrin} ${api_url}"
alias _jobs="oc login -u jobs -p ${jobs} ${api_url}"
alias _wozniak="oc login -u wozniak -p ${wozniak} ${api_url}"
```
## Log in as each user to `test` authentication:
```shell
_armstrong;_collins;_wozniak;_aldrin;_jobs;
```
## Log back in as the administrator to `verify` the users and identities:
```shell
_kube
oc get users
oc get identity
```

## Conclusion

Configured an HTPasswd identity provider on an OpenShift cluster and test authentication with several user accounts. This was accomplished by creating an HTPasswd file with user accounts and passwords, creating a secret from the file, editing the oauth/cluster resource to use the HTPasswd identity provider, and testing authentication with several user accounts. 



