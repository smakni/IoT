#!/bin/bash

kubectl config set-context --current --namespace=dev 

kubectl config  current-context                      

podName=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")

kubectl port-forward $podName 8888:8888  