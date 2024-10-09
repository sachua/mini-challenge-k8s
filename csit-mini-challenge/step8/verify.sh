#!/bin/bash

running=$(kubectl get deploy -n default command-center -o jsonpath='{.status.readyReplicas}')
imageName=$(kubectl get deploy -n default command-center -o jsonpath='{.spec.template.spec.containers[0].image}')
investigationPort=$(kubectl get deploy -n default investigation-unit -o jsonpath='{.spec.template.spec.containers[0].ports[?(@.containerPort==80)].containerPort}')
analysisPort=$(kubectl get deploy -n default analysis-unit -o jsonpath='{.spec.template.spec.containers[0].ports[?(@.containerPort==80)].containerPort}')
kubectl get svc -n default investigation-unit
kubectl get svc -n default analysis-unit

if [[ "${running}" < 1 ]] || [[ "${imageName}" != "sachua/task-3:v0.0.1" ]] || [[ "${investigationPort}" != "80" ]] || [[ "${analysisPort}" != "80" ]]; then exit 1; fi
