#!/bin/bash

echo "Detete P3 setup"

kubectl delete -f ../confs/argocd/install.yaml --force --ignore-not-found

kubectl delete namespaces argocd dev

k3d cluster delete -a