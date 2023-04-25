#verify the kubeadmin again
oc login -u kubeadmin -p $x $y

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

    done

    if [ "$(oc project -q)" != "pathfinder" ]; then 
        oc label node master01 start=trick
        oc label node master02 start=trick
        oc label node master03 start=trick
    fi

    echo "$project_name content" > index.html && oc new-app --name=$app_name  --image=nginx --strategy=source --binary=true --output=yaml | oc apply -f - && oc start-build $app_name --from-dir=./ --follow

    oc expose service $app_name
done


oc project default

