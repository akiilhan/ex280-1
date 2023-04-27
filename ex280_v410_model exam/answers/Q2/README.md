# Configure cluster permissions

## Configure your OpenShift cluster to meet the following requirements:

The user account jobs can perform cluster administration tasks

The user account wozniak can create projects

The user account wozniak cannot perform cluster administration tasks

The user account armstrong cannot create projects

The user account kubeadmin is not present

## Adding a user to cluster-admin role for jobs

To add a user to the cluster-admin role for jobs, use the following command:
```shell
oc adm policy add-cluster-role-to-user cluster-admin jobs
```
## Logging in as a jobs user

To login as a jobs user, use the following command:
```shell
_jobs
```
## Removing users from creating new projects

To remove every user from creating a new project, use the following commands:
```shell
oc describe clusterrolebindings.rbac.authorization.k8s.io |grep self-pro
oc describe clusterrolebindings.rbac.authorization.k8s.io self-provisioner
oc adm policy remove-cluster-role-from-group self-provisioner system:authenticated:oauth

```
## Adding a user to the self-provisioner role to create projects

To add a user to the self-provisioner role to create projects, use the following command:
```shell
oc adm policy add-cluster-role-to-user self-provisioner wozniak
```

## Removing kubeadmin
To remove kubeadmin, use the following command:

```shell
oc delete secrets kubeadmin -n kube-system
```




