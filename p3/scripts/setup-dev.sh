#!/bin/bash

echo "** Setup Dev **"

echo "** kubectl create namespace argocd **"
kubectl create namespace dev

echo "** kubectl apply argocd confs **"
kubectl apply -n argocd -f ../confs/dev

echo "Dev setup complete"

