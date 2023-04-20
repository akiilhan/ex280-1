
#create the new project as per given in the exam
oc new-project apollo
oc new-project manhattan
oc new-project gemini
oc new-project bluebook
oc new-project titan

#make armstrong as admin in apollo & gemini project 
oc adm policy add-role-to-user admin armstrong -n apollo
oc adm policy add-role-to-user admin armstrong -n gemini

#add view permission to wozniak in titan project
oc adm policy add-role-to-user view wozniak -n titan


#verify the roles inside the project 

oc project apollo
oc describe rolebindings.rbac.authorization.k8s.io 
# search for armstrong user

oc project gemini
oc describe rolebindings.rbac.authorization.k8s.io 
# search for armstrong user

oc project gemini
oc describe rolebindings.rbac.authorization.k8s.io
# search for wozniak user