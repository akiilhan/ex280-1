#!/bin/bash

date
#copy kubeadmin password and api to workstation
mkdir /home/student/copy
scp -r root@utility:/home/lab/ocp4/auth/kube* /home/student/copy
scp -r root@utility:/home/lab/* /home/student/copy
x=$(cat /home/student/copy/kubeadmin-password)
y=$(cat /home/student/copy/kubeconfig | grep server | awk -F" " '{print $2}'|uniq) 


chmod 775 wait_modified.sh
./wait_modified.sh


#verify the kubeadmin again
oc login -u kubeadmin -p $x $y

#since lab doesn't have worker noce adding taint in master node  in exam its worker node
oc adm taint node master02 key1=value1:NoSchedule
oc adm taint node master03 key1=value1:NoSchedule

for i in bullwinkle,rocky gru,minion lerna,hydra area51,oxcart math,qed apples,oranges pathfinder,voyager mercury,atlas; do 
    IFS=',' read project_name app_name <<< "${i}"
    echo "${project_name}" and "${app_name}"

    #creating projects
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
    
    #creating applicatio of respective projects
    echo "$project_name content" > index.html && oc new-app --name=$app_name  httpd --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build $app_name --from-dir=./ --follow

    oc expose service $app_name
done


oc project default
date
