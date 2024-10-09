#!/bin/bash

running=$(kubectl get pod -n default -l app=investigation-unit -o jsonpath='{.items[0].status.phase}')
imageName=$(kubectl get deploy -n default investigation-unit -o jsonpath='{.spec.template.spec.containers[0].image}')
if [[ "${imageName}" != "sachua/task-1:v0.0.1" ]] || [[ "${running}" != "Running" ]]; then exit 1; fi
