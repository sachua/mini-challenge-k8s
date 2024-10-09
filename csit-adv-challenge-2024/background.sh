#!/bin/bash

ssh node01 systemctl stop kubelet

kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: analysis-unit
spec:
  selector:
    matchLabels:
      app: analysis-unit
  template:
    metadata:
      labels:
        app: analysis-unit
    spec:
      nodeSelector:
        kubernetes.io/hostname: node01
      containers:
      - name: task-2
        image: sachua/task-2:v0.0.1
        ports:
        - containerPort: 80
EOF
