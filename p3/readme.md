# P3

## Links

https://k3d.io/v5.4.6/

https://github.com/k3d-io/k3d

https://argo-cd.readthedocs.io/en/stable/

https://github.com/argoproj/argo-cd

https://www.sokube.ch/post/gitops-on-a-laptop-with-k3d-and-argocd

https://www.techmanyu.com/setup-a-gitops-deployment-model-on-your-local-development-environment-with-k3s-k3d-and-argocd-4be0f4f30820

https://hub.docker.com/r/wil42/playground/tags

https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/

https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/

https://yashguptaa.medium.com/application-deploy-to-kubernetes-with-argo-cd-and-k3d-8e29cf4f83ee

## Commands

	kubectl get namespaces

	kubectl get pods -A

	kubectl describe ingress -A

	kubectl delete namespaces argocd

	kubectl delete -f install.yaml --force --ignore-not-found

	k3d cluster delete -a

Install k3d

	➜  p3 git:(master) ✗ curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

		Preparing to install k3d into /usr/local/bin
		Password:
		k3d installed into /usr/local/bin/k3d
		Run 'k3d --help' to see what you can do with it.

	➜  p3 git:(master) ✗ k3d --version

		k3d version v5.4.6
		k3s version v1.24.4-k3s1 (default)

You can use the following command to create a single node cluster with name dev-cluster and the following port requirements

	➜  p3 git:(master) ✗ k3d cluster create dev-cluster --port 8080:80@loadbalancer --port 8443:443@loadbalancer

		INFO[0000] portmapping '8080:80' targets the loadbalancer: defaulting to [servers:*:proxy agents:*:proxy] 
		INFO[0000] portmapping '8443:443' targets the loadbalancer: defaulting to [servers:*:proxy agents:*:proxy] 
		INFO[0000] Prep: Network                                
		INFO[0000] Created network 'k3d-dev-cluster'            
		INFO[0000] Created image volume k3d-dev-cluster-images  
		INFO[0000] Starting new tools node...                   
		INFO[0001] Pulling image 'ghcr.io/k3d-io/k3d-tools:5.4.6' 
		INFO[0002] Creating node 'k3d-dev-cluster-server-0'     
		INFO[0002] Starting Node 'k3d-dev-cluster-tools'        
		INFO[0003] Pulling image 'docker.io/rancher/k3s:v1.24.4-k3s1' 
		INFO[0009] Creating LoadBalancer 'k3d-dev-cluster-serverlb' 
		INFO[0009] Pulling image 'ghcr.io/k3d-io/k3d-proxy:5.4.6' 
		INFO[0012] Using the k3d-tools node to gather environment information 
		INFO[0012] Starting new tools node...                   
		INFO[0012] Starting Node 'k3d-dev-cluster-tools'        
		INFO[0013] Starting cluster 'dev-cluster'               
		INFO[0013] Starting servers...                          
		INFO[0013] Starting Node 'k3d-dev-cluster-server-0'     
		INFO[0019] All agents already running.                  
		INFO[0019] Starting helpers...                          
		INFO[0019] Starting Node 'k3d-dev-cluster-serverlb'     
		INFO[0025] Injecting records for hostAliases (incl. host.k3d.internal) and for 3 network members into CoreDNS configmap... 
		INFO[0028] Cluster 'dev-cluster' created successfully!  
		INFO[0028] You can now use it like this:                
		kubectl cluster-info

Install ArgoCD

	➜  p3 git:(master) ✗ kubectl create namespace argocd
	
		namespace/argocd created

	➜  p3 git:(master) ✗ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	

		customresourcedefinition.apiextensions.k8s.io/applications.argoproj.io created
		customresourcedefinition.apiextensions.k8s.io/applicationsets.argoproj.io created
		customresourcedefinition.apiextensions.k8s.io/appprojects.argoproj.io created
		serviceaccount/argocd-application-controller created
		serviceaccount/argocd-applicationset-controller created
		serviceaccount/argocd-dex-server created
		serviceaccount/argocd-notifications-controller created
		serviceaccount/argocd-redis created
		serviceaccount/argocd-repo-server created
		serviceaccount/argocd-server created
		role.rbac.authorization.k8s.io/argocd-application-controller created
		role.rbac.authorization.k8s.io/argocd-applicationset-controller created
		role.rbac.authorization.k8s.io/argocd-dex-server created
		role.rbac.authorization.k8s.io/argocd-notifications-controller created
		role.rbac.authorization.k8s.io/argocd-server created
		clusterrole.rbac.authorization.k8s.io/argocd-application-controller created
		clusterrole.rbac.authorization.k8s.io/argocd-server created
		rolebinding.rbac.authorization.k8s.io/argocd-application-controller created
		rolebinding.rbac.authorization.k8s.io/argocd-applicationset-controller created
		rolebinding.rbac.authorization.k8s.io/argocd-dex-server created
		rolebinding.rbac.authorization.k8s.io/argocd-notifications-controller created
		rolebinding.rbac.authorization.k8s.io/argocd-redis created
		rolebinding.rbac.authorization.k8s.io/argocd-server created
		clusterrolebinding.rbac.authorization.k8s.io/argocd-application-controller created
		clusterrolebinding.rbac.authorization.k8s.io/argocd-server created
		configmap/argocd-cm created
		configmap/argocd-cmd-params-cm created
		configmap/argocd-gpg-keys-cm created
		configmap/argocd-notifications-cm created
		configmap/argocd-rbac-cm created
		configmap/argocd-ssh-known-hosts-cm created
		configmap/argocd-tls-certs-cm created
		secret/argocd-notifications-secret created
		secret/argocd-secret created
		service/argocd-applicationset-controller created
		service/argocd-dex-server created
		service/argocd-metrics created
		service/argocd-notifications-controller-metrics created
		service/argocd-redis created
		service/argocd-repo-server created
		service/argocd-server created
		service/argocd-server-metrics created
		deployment.apps/argocd-applicationset-controller created
		deployment.apps/argocd-dex-server created
		deployment.apps/argocd-notifications-controller created
		deployment.apps/argocd-redis created
		deployment.apps/argocd-repo-server created
		deployment.apps/argocd-server created
		statefulset.apps/argocd-application-controller created
		networkpolicy.networking.k8s.io/argocd-application-controller-network-policy created
		networkpolicy.networking.k8s.io/argocd-dex-server-network-policy created
		networkpolicy.networking.k8s.io/argocd-redis-network-policy created
		networkpolicy.networking.k8s.io/argocd-repo-server-network-policy created
		networkpolicy.networking.k8s.io/argocd-server-network-policy created

	➜  p3 git:(master) ✗ kubectl apply -f ingress.yaml -n argocd

		ingress.networking.k8s.io/argocd-ingress created

If apiVersion error, install kubectl convert and:

	➜  p3 git:(master) ✗ kubectl convert -f ingress.yaml --output-version networking.k8s.io/v1 > ingress-converted.yaml
	
	➜  p3 git:(master) ✗ kubectl apply -f ingress-converted.yaml -n argocd 

	ingress.networking.k8s.io/argocd-ingress created

Chrome -> http://localhost:8080/argocd

Get admin password

	➜  p3 git:(master) ✗ kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo

		ry03VlrmB099xja3

Setup project synch

	➜  p3 git:(master) ✗ kubectl create namespace dev
		namespace/dev created

	➜  p3 git:(master) ✗ cat > project.yaml << EOF 
		apiVersion: argoproj.io/v1alpha1
		kind: AppProject
		metadata:
		name: development
		labels:
			app: development
		spec:
		# Project description
		description: Dev ArgoCD Project to deploy our app locally
		# Allow manifests to deploy only from Sokube git repositories
		sourceRepos:
		- "https://github.com/surenraju/*"
		# Only permit to deploy applications in the same cluster
		destinations:
		- namespace: dev
			server: https://kubernetes.default.svc
		# Enables namespace orphaned resource monitoring.
		orphanedResources:
			warn: false
		EOF

	➜  p3 git:(master) ✗ kubectl create -n argocd -f project.yaml
		appproject.argoproj.io/development created

	➜  p3 git:(master) ✗ cat > application.yaml << EOF 
		apiVersion: argoproj.io/v1alpha1
		kind: Application
		metadata:
		name: nginx-app
		labels:
			app: nginx-app
		spec:
		destination:
			namespace: dev
			server: 'https://kubernetes.default.svc'
		source:
			path: helm
			repoURL: 'https://github.com/surenraju/nginx-gitops.git'
			targetRevision: HEAD
			helm:
			valueFiles:
				- values.yaml
		project: development
		syncPolicy:
			automated:
			prune: true
			selfHeal: true
		EOF

	➜  p3 git:(master) ✗ kubectl create -n argocd -f application.yaml

		application.argoproj.io/nginx-app created

Last thing to access our deployed app we will need

	➜  scripts git:(master) ✗ kubectl config set-context --current --namespace=dev 

		Context "k3d-dev-cluster" modified.
	
	➜  scripts git:(master) ✗ kubectl config  current-context                      
	
		k3d-dev-cluster

	➜  scripts git:(master) ✗ kubectl get pods               

		NAME                   READY   STATUS    RESTARTS   AGE
		app-5568948986-rslcz   1/1     Running   0          16m
	
	➜  scripts git:(master) ✗ kubectl port-forward app-5568948986-rslcz 8888:8888  

		Forwarding from 127.0.0.1:8888 -> 8888
		Forwarding from [::1]:8888 -> 8888
		Handling connection for 8888
		Handling connection for 8888
