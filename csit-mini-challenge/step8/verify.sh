#!/bin/bash

running=$(kubectl get pod -n default -l app=command-center -o jsonpath='{.items[0].status.phase}')
imageName=$(kubectl get deploy -n default command-center -o jsonpath='{.spec.template.spec.containers[0].image}')
investigationPort=$(kubectl get pod -n default -l app=investigation-unit -o jsonpath='{.items[0].spec.containers[0].ports[?(@.containerPort==80)].containerPort}')
analysisPort=$(kubectl get pod -n default -l app=analysis-unit -o jsonpath='{.items[0].spec.containers[0].ports[?(@.containerPort==80)].containerPort}')
kubectl get svc -n default investigation-unit
kubectl get svc -n default analysis-unit

if [[ "${running}" != "Running" ]] || [[ "${imageName}" != "sachua/task-3:v0.0.1" ]] || [[ "${investigationPort}" != "80" ]] || [[ "${analysisPort}" != "80" ]]; then exit 1; fi
