#create mypass.txt file by "vim mypass.txt" command type the text as shown in mypass.txt file

#excute the below commands 
source mypass.txt
oc login -u kubeadmin -p ${kube_pass} ${api_url} #will be logged as 

#creating htpasswd encrypted file with htpasswd-file as file name
htpasswd -c -B -b htpasswd-file armstrong indionce
htpasswd    -B -b htpasswd-file collins veraster
htpasswd    -B -b htpasswd-file aldrin roonkere
htpasswd    -B -b htpasswd-file jobs sestiver
htpasswd    -B -b htpasswd-file wozniak glegunge

#create a secret "ex280-idp-secret" from the file htpasswd-file 
oc create secret generic ex280-idp-secret --from-file htpasswd=htpasswd-file -n openshift-config 



#download a copy of yaml file from openshift cluster
oc get oauth/cluster -o yaml> oauth.yaml

#edit yaml file under spec as follows to update secret and identity
spec:
  identityProviders:
  - name: ex280-htpasswd
    mappingMethod: claim
    type: HTPasswd
    htpasswd:
      fileData:
        name: ex280-idp-secret

#replace the new yaml in openshift yaml file
oc replace  -f oauth.yaml


#optional to create alias for quick login
alias _kube="oc login -u kubeadmin -p ${kube_pass} ${api_url}"
alias _armstrong="oc login -u armstrong -p ${armstrong} ${api_url}"
alias _collins="oc login -u collins -p ${collins} ${api_url}"
alias _aldrin="oc login -u aldrin -p ${aldrin} ${api_url}"
alias _jobs="oc login -u jobs -p ${jobs} ${api_url}"
alias _wozniak="oc login -u wozniak -p ${wozniak} ${api_url}"

#login as every user
_armstrong;_collins;_wozniak;_aldrin;_jobs;

#should be login as kubeadmin to check users and pods cause its has admin privilege
_kube

#verify users and identity
oc get users
oc get identity


