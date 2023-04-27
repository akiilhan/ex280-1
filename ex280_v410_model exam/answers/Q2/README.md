# Configure cluster permissions

This section describes how to configure an OpenShift cluster to meet the following requirements:

- The user account jobs can perform cluster administration tasks
- The user account wozniak can create projects
- The user account wozniak cannot perform cluster administration tasks
- The user account armstrong cannot create projects
- The user account kubeadmin is not present

## Adding a user to cluster-admin role for jobs

To grant cluster-admin access to a user, use the following command:

```shell
oc adm policy add-cluster-role-to-user <user-name>
```

To add a user to the `cluster-admin` role for `jobs`, use the following command:

```shell
oc adm policy add-cluster-role-to-user cluster-admin jobs
```

## Logging in as a jobs user

To log in as a `jobs` user, use the following command:

```shell
_jobs
```

## Removing users from creating new projects

To `remove every user from creating a new project`, use the following commands:

```shell
oc describe clusterrolebindings.rbac.authorization.k8s.io | grep self-pro
oc describe clusterrolebindings.rbac.authorization.k8s.io self-provisioner
oc adm policy remove-cluster-role-from-group self-provisioner system:authenticated:oauth
```

## Adding a user to the self-provisioner role to create projects

To grant project creation access to a user, use the following command:

```shell
oc adm policy add-cluster-role-to-user self-provisioner <user-name>
```
To add a `wozniak` user to the self-provisioner role to create projects, use the following command:

```shell
oc adm policy add-cluster-role-to-user self-provisioner wozniak
```

## Preventing users from performing cluster administration tasks

To prevent users from performing cluster administration tasks, such as the user account `wozniak`, use the following commands:

```shell
oc adm policy remove-cluster-role-from-user cluster-admin wozniak
```

## Preventing a user from creating projects

To prevent a `armstrong` user from creating projects, such as the user account armstrong, use the following commands:

```shell
oc adm policy remove-cluster-role-from-user self-provisioner armstrong
```

## Removing kubeadmin

To `remove kubeadmin`, use the following command:

```shell
oc delete secrets kubeadmin -n kube-system
```

## Conclusion

These commands will help you configure your OpenShift cluster with the specified user account permissions in cluster level and remove the kubeadmin user account.










