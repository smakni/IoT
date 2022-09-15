# P2

What's the difference between a Service and a Deployment in Kubernetes? A deployment is responsible for keeping a set of pods running. A service is responsible for enabling network access to a set of pods. We could use a deployment without a service to keep a set of identical pods running in the Kubernetes cluster.
## Links

https://rancher.com/docs/k3s/latest/en/

https://k33g.gitlab.io/articles/2020-02-21-K3S-02-FIRST-DEPLOY.html

### Example docker image

https://hub.docker.com/r/paulbouwer/hello-kubernetes/tags

https://github.com/paulbouwer/hello-kubernetes

### kubernetes

https://kubernetes.io/docs/concepts/architecture/nodes/

https://kubernetes.io/docs/concepts/services-networking/service/

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

https://kubernetes.io/fr/docs/concepts/services-networking/ingress/

https://mvallim.github.io/kubernetes-under-the-hood/documentation/kube-flannel.html


## Commands

### Setup cluster after k3s node install

	kubectl apply -f {{FILE.yaml || FOLDER}}

### Check

Please wait until all services are ready and your node's ip address is set, check the ingress config to be sure. 

#### Inside VM

	vagrant ssh

	kubectl get nodes -o wide

	kubectl get all -n kube-system

	kubectl describe ingress

#### Outside VM

In a browser if we go to `http://192.168.42.110` we can access app-three because it doesn't have any host header restriction

To check app-one and app-two we can use curl and modify the host header

	curl -H "Host:app2.com" http://192.168.42.110
