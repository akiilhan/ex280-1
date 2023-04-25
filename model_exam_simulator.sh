#!/bin/bash

#copy kubeadmin password and api to workstation
scp -r root@utility:/home/lab/ocp4/auth/kube* .
x=$(cat /home/student/ex280/kubeadmin-password)
y=$(cat /home/student/ex280/kubeconfig | grep server | awk -F" " '{print $2}'|uniq) 

#since server is slow it will take some time connect
sleep 300;

#login kubeadmin untill its logged
oc login -u kubeadmin -p $x $y
while [ "$(oc whoami)" != "kube:admin" ]

do
   echo  "kubeadmin not logged";
   echo  "kubeadmin  logging";
   oc login -u kubeadmin -p $x $y;
   sleep 60;

done

#more waiting time
sleep 200;


#verify the kubeadmin again
oc login -u kubeadmin -p $x $y

oc adm taint node master02 key1=value1:NoSchedule
oc adm taint node master03 key1=value1:NoSchedule

for i in bullwinkle,rocky gru,minion lerna,hydra area51,oxcart math,qed apples,oranges pathfinder,voyager mercury,atlas; do 
    IFS=',' read project_name app_name <<< "${i}"
    echo "${project_name}" and "${app_name}"


    oc new-project $project_name
    while [ "$(oc project -q)" != $project_name ]

    do
        echo  "$project_name project not found";
        echo  "creating $project_name project";
        oc new-project $project_name
        sleep 10;
        oc project $project_name

    done

    if [ "$(oc project -q)" == "pathfinder" ]; then 
        oc label node master01 start=trick
        oc label node master02 start=trick
        oc label node master03 start=trick
    fi
    
    echo "$project_name content" > index.html && oc new-app --name=$app_name  httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build $app_name --from-dir=./ --follow

    oc expose service $app_name
done


oc project default
