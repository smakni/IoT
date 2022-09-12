# Ressources

## Links

https://www.vagrantup.com/docs

https://app.vagrantup.com/centos/boxes/7

### K3S

https://www.rancher.co.jp/docs/k3s/latest/en/quick-start/

https://mvallim.github.io/kubernetes-under-the-hood/documentation/kube-flannel.html

## Commands

remove all

	vagrant box list | cut -f 1 -d ' ' | xargs -L 1 vagrant box remove -f

Vangrant status

	vagrant status [name|id]

Install vbguest on machine

	vagrant plugin install vagrant-vbguest

Check config from host with k3s.yaml

	kubectl --kubeconfig shared/k3s.yaml -o wide get nodes

Check Ingress
	
	kubectl get ingress