#!/bin/bash

running=$(kubectl get pod -n default investigation-pod -o jsonpath='{.status.phase}')
imageName=$(kubectl get pod -n default command-center -o jsonpath='{.spec.containers[?(@.name=="command-center")].image}')
investigationPort=$(kubectl get pod -n default investigation-pod -o jsonpath='{.spec.containers[?(@.name=="investigation-pod")].ports[?(@.containerPort==80)].containerPort}')
analysisPort=$(kubectl get pod -n default analysis-pod -o jsonpath='{.spec.containers[?(@.name=="analysis-pod")].ports[?(@.containerPort==80)].containerPort}')
kubectl get svc -n default investigation-svc
kubectl get svc -n default analysis-svc

if [[ "${running}" != "Running" ]] || [[ "${running}" != "Completed" ]];then exit 1; fi
if [[ "${imageName}" != "sachua/task-3:v0.0.1" ]] || [[ "${investigationPort}" != "80" ]] || [[ "${analysisPort}" != "80" ]]; then exit 1; fi
