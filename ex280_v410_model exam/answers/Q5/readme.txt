#create a new quota
oc create quota --help
#take first example and modify it in manhattan project
oc create quota ex280-quota --hard=cpu=2,memory=1Gi,pods=3,services=6,replicationcontrollers=3 -n manhattan 

#verify the quota
oc get resourcequotas -n manhattan