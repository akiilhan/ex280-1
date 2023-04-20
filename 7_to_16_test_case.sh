#!/bin/bash

scp -r root@utility:/home/lab/ocp4/auth/kube* .
x=$(cat /home/student/ex280/kubeadmin-password)
y=$(cat /home/student/ex280/kubeconfig | grep server | awk -F" " '{print $2}'|uniq) 
oc login -u kubeadmin -p $x $y



while [ "$(oc whoami)" != "kube:admin" ]

do
   echo  "kubeadmin not logged";
   sleep 10;
   echo  "kubeadmin  logging";
   oc login -u kubeadmin -p $x $y;

done


project_name=$"bullwinkle"
oc new-project $project_name

while [ "$(oc project -q)" != $project_name ]

do
   echo  "$project_name project not found";
   sleep 10;
   echo  "creating $project_name project";
   oc login -u kubeadmin -p $x $y;

done


oc adm taint node master02 key1=value1:NoSchedule
oc adm taint node master03 key1=value1:NoSchedule
eecho "bullwinkle content" > index.html && oc new-app --name=rocky httpd  --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build rocky --from-dir=./ --follow
oc expose service rocky



 
project_name=$"gru"
oc new-project $project_name

while [ "$(oc project -q)" != $project_name ]

do
   echo  "$project_name project not found";
   sleep 10;
   echo  "creating $project_name project";
   oc login -u kubeadmin -p $x $y;

done
echo "gru content" > index.html && oc new-app --name=minion httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build minion --from-dir=./ --follow
oc expose service minion 



project_name=$"lerna"
oc new-project $project_name

while [ "$(oc project -q)" != $project_name ]

do
   echo  "$project_name project not found";
   sleep 10;
   echo  "creating $project_name project";
   oc login -u kubeadmin -p $x $y;

done 
echo "lerna content" > index.html && oc new-app --name=hydra httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build hydra --from-dir=./ --follow
oc expose service hydra



project_name=$"area51"
oc new-project $project_name

while [ "$(oc project -q)" != $project_name ]

do
   echo  "$project_name project not found";
   sleep 10;
   echo  "creating $project_name project";
   oc login -u kubeadmin -p $x $y;

done
echo "lerna content" > index.html && oc new-app --name=oxcart httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build oxcart --from-dir=./ --follow
oc expose service oxcart



project_name=$"math"
oc new-project $project_name

while [ "$(oc project -q)" != $project_name ]

do
   echo  "$project_name project not found";
   sleep 10;
   echo  "creating $project_name project";
   oc login -u kubeadmin -p $x $y;

done
echo "math content" > index.html && oc new-app --name=qed httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build qed --from-dir=./ --follow
oc expose service qed 



 
project_name=$"apples"
oc new-project $project_name

while [ "$(oc project -q)" != $project_name ]

do
   echo  "$project_name project not found";
   sleep 10;
   echo  "creating $project_name project";
   oc login -u kubeadmin -p $x $y;

done
echo "apples content" > index.html && oc new-app --name=oranges httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build oranges --from-dir=./ --follow
oc expose service oranges 



project_name=$"pathfinder"
oc new-project $project_name

while [ "$(oc project -q)" != $project_name ]

do
   echo  "$project_name project not found";
   sleep 10;
   echo  "creating $project_name project";
   oc login -u kubeadmin -p $x $y;

done
echo "pathfinder content" > index.html && oc new-app --name=voyager httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build voyager --from-dir=./ --follow
oc expose service voyager 
oc label node master01 start=trick
oc label node master02 start=trick
oc label node master03 start=trick
oc expose service voyager 


project_name=$"mercury"
oc new-project $project_name

while [ "$(oc project -q)" != $project_name ]

do
   echo  "$project_name project not found";
   sleep 10;
   echo  "creating $project_name project";
   oc login -u kubeadmin -p $x $y;

done
echo "mercury content" > index.html && oc new-app --name=atlas httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build atlas --from-dir=./ --follow
oc expose service atlas
