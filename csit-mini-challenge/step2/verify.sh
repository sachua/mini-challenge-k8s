#!/bin/bash

running=$(kubectl get deploy -n default command-center -o jsonpath='{.status.readyReplicas}')
imageName=$(kubectl get deploy -n default investigation-unit -o jsonpath='{.spec.template.spec.containers[0].image}')
if [[ "${imageName}" != "sachua/task-1:v0.0.1" ]] || [[ "${running}" < 1 ]]; then exit 1; fi
