#!/bin/sh
# Set KUBECONFIG
export KUBECONFIG=/home/student/copy/kubeconfig
# Wait for API to come online
until [ $(curl -k -s https://api.ocp4.example.com:6443/version?timeout=10s | jq -r '.major' | grep -v null | wc -l) -eq 1 ]
do
  echo "Waiting for API..."
  sleep 10
done
echo "API is up"
echo "Cluster version is $(oc get clusterversion version -o json | jq -r '.status.history[0].version')"
until [ not $(curl -k -s https://console-openshift-console.apps.ocp4.example.com >/dev/null) ]
do
  echo "Waiting for router..."
  sleep 10 
done
echo "Router is up"
while true
do
  code=$(curl -k -s https://oauth-openshift.apps.ocp4.example.com)
  if [[ ! -z ${code} ]] && [[ "${code:0:1}" == "{" ]] && [[ $(echo $code | jq -r '.code') -eq 403 ]]
  then
    break
  fi
  echo "Waiting for authentication..."
  sleep 10
done
echo "Authentication is ready"
for oper in ingress kube-apiserver
do
  until [ $(oc get clusteroperators ${oper} -o json | jq -r '.status.conditions[]|select((.status=="True") and (.type=="Progressing"))'| wc -l) -eq 0 ]
  do
    echo "Waiting for the ${oper} operator to be ready..."
    sleep 10
  done
  echo "The ${oper} operator is ready"
done
until [ $(oc get mcp -o json | jq -r '.items[].status.conditions[]|select((.status=="True") and (.type=="Updating"))' | wc -l) -eq 0 ]
do
  echo "Waiting for Machine Config Operator to finish applying changes..."
  sleep 10
done
echo "Machine Config Operator changes applied"
