# P1

The master node does not run any containers, it just handles and manages the cluster. The nodes that actually run the containers are the worker nodes. We’re going to configure two of them.

## Links

https://www.vagrantup.com/docs

https://app.vagrantup.com/centos/

https://akos.ma/blog/vagrant-k3s-and-virtualbox/

https://blog.filador.fr/a-la-decouverte-de-k3s/

https://www.rancher.co.jp/docs/k3s/latest/en/quick-start/

https://mvallim.github.io/kubernetes-under-the-hood/documentation/kube-flannel.html

https://www.vagrantup.com/docs

https://app.vagrantup.com/centos/
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

Check logs

	journalctl -u k3s