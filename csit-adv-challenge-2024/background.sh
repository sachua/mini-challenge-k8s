#!/bin/bash

ssh node01 systemctl stop kubelet

node01ready=$(kubectl get nodes node01 --no-headers | awk '{print $2}')

while [[ "${node01ready}" != "NotReady" ]]; do sleep 1; done

touch /tmp/finished