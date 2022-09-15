#!/bin/bash

echo "** Setup Dev **"

echo "** kubectl create namespace dev **"
kubectl create namespace dev

echo "** kubectl apply argocd confs **"
kubectl apply -n argocd -f ../confs/dev

echo "** kubectl wait for availability **"
sleep 10
kubectl rollout status -n dev deploy/app

echo "Dev setup complete forwarding ports, it should be avaible at http://localhost:8888"

sh ./forward-port-app.sh

