#!/bin/bash

echo "** Setup ArgoCD **"

echo "** k3d create cluster **"
k3d cluster create dev-cluster --port 8080:80@loadbalancer --port 8443:443@loadbalancer --port 8888:8888@loadbalancer

echo "** kubectl create namespace argocd **"
kubectl create namespace argocd
sleep 20

echo "** kubectl apply argocd confs **"
kubectl apply -n argocd -f ../confs/argocd

echo "** kubectl wait for availability **"
kubectl rollout status -n argocd deploy/argocd-server

echo "Argocd setup complete it should be available at http://localhost:8080/argocd"

password=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

echo "login: admin | password: $password"

