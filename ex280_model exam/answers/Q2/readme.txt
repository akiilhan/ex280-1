#add job to cluster-admin role
oc adm policy add-cluster-role-to-user cluster-admin jobs

#login as jobs
_jobs

#to remove every user from creating a new project 
oc describe clusterrolebindings.rbac.authorization.k8s.io |grep self-pro
oc describe clusterrolebindings.rbac.authorization.k8s.io self-provisioner
oc adm policy remove-cluster-role-from-group self-provisioner system:authenticated:oauth

#to make wozniak to create project
oc adm policy add-cluster-role-to-user self-provisioner  wozniak

#remove kubeadmin
oc delete secrets kubeadmin -n kube-system


