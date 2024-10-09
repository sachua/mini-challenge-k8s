#!/bin/bash

imageName=$(kubectl get deploy -n default analysis-unit -o jsonpath='{.spec.template.spec.containers[0].image}')
location=$(kubectl exec -n default -l app=analysis-unit -- cat /mnt/location/tipoff)
if [[ "${imageName}" != "sachua/task-2:v0.0.1" ]] || [[ "${location}" != "gAAAAABnBNfVYBZhvKfjHG4DCGSMmWshfu6VYtiERpvz3JiHn8ob0lovnqSqbv_gCKQDSW1uG7NpVfIEJSktUvTZk-dXxKn28RXCK_d1cGAkquq2CEYg8NI=" ]]; then exit 1; fi
