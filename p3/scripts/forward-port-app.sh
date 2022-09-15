#!/bin/bash

podName=$(kubectl -n dev get pods --no-headers -o custom-columns=":metadata.name")

echo "** Forwarding pod $podName to http://localhost:8888 **"

kubectl -n dev port-forward $podName 8888:8888
