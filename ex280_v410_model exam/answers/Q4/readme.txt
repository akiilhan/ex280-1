#create new groups as per the exam
oc adm groups new commander 
oc adm groups new pilot 

#add users to the group
oc adm groups add-users --help
oc adm groups add-users commander armstrong 
oc adm groups add-users pilot collins aldrin 

#verify the groups and users
oc get groups.user.openshift.io 

#assign roles to the groups
oc adm policy add-role-to-group edit commander -n apollo
oc adm policy add-role-to-group view pilot -n apollo