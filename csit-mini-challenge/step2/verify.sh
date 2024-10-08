#!/bin/bash

running=$(kubectl get pod -n default investigation-pod -o jsonpath='{.status.phase}')
imageName=$(kubectl get pod -n default investigation-pod -o jsonpath='{.spec.containers[?(@.name=="investigation-pod")].image}')
if [[ "${imageName}" != "sachua/task-1:v0.0.1" ]] || [[ "${running}" != "Running" ]]; then exit 1; fi