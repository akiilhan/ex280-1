#create limit.yaml file as shown

#create and save the yaml file to bluebook project
oc create -f limit.yaml --save-config -n bluebook

#verfiy the limit in bluebook project
oc describe limitranges -n bluebook