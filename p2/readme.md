# P2

## Links

https://k33g.gitlab.io/articles/2020-02-21-K3S-02-FIRST-DEPLOY.html

### Example docker image

https://hub.docker.com/r/paulbouwer/hello-kubernetes/tags

https://github.com/paulbouwer/hello-kubernetes

### kubernetes

https://kubernetes.io/docs/concepts/architecture/nodes/

https://kubernetes.io/docs/concepts/services-networking/service/

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

https://kubernetes.io/fr/docs/concepts/services-networking/ingress/


## Commands

### Setup

	kubectl apply -f example.yaml

### Check

	kubectl get nodes -o wide

	kubectl get all -n kube-system

	kubectl describe ingress