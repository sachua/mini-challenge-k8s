#!/bin/bash

ssh node01 systemctl stop kubelet

while [[ "$(kubectl get nodes node01 --no-headers | awk '{print $2}')" != "NotReady" ]]; do sleep 1; done

touch /tmp/finished