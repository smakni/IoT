# VAGRANT

## Get Started

	➜  vagrant_getting_started git:(master) ✗ vagrant init hashicorp/bionic64

	A `Vagrantfile` has been placed in this directory. You are now
	ready to `vagrant up` your first virtual environment! Please read
	the comments in the Vagrantfile as well as documentation on
	`vagrantup.com` for more information on using Vagrant.

	➜  vagrant_getting_started git:(master) ✗ vagrant box add hashicorp/bionic64

	==> box: Loading metadata for box 'hashicorp/bionic64'
		box: URL: https://vagrantcloud.com/hashicorp/bionic64
	This box can work with multiple providers! The providers that it
	can work with are listed below. Please review the list and choose
	the provider you will be working with.

	1) hyperv
	2) virtualbox
	3) vmware_desktop

	Enter your choice: 2
	==> box: Adding box 'hashicorp/bionic64' (v1.0.282) for provider: virtualbox
		box: Downloading: https://vagrantcloud.com/hashicorp/boxes/bionic64/versions/1.0.282/providers/virtualbox.box
	==> box: Successfully added box 'hashicorp/bionic64' (v1.0.282) for 'virtualbox'!
	
	➜  vagrant_getting_started git:(master) ✗ vagrant up

	Bringing machine 'default' up with 'virtualbox' provider...
	==> default: Importing base box 'hashicorp/bionic64'...
	==> default: Matching MAC address for NAT networking...
	==> default: Checking if box 'hashicorp/bionic64' version '1.0.282' is up to date...
	==> default: Setting the name of the VM: vagrant_getting_started_default_1661502366967_79117
	==> default: Clearing any previously set network interfaces...
	==> default: Preparing network interfaces based on configuration...
		default: Adapter 1: nat
	==> default: Forwarding ports...
		default: 22 (guest) => 2222 (host) (adapter 1)
	==> default: Booting VM...
	==> default: Waiting for machine to boot. This may take a few minutes...
		default: SSH address: 127.0.0.1:2222
		default: SSH username: vagrant
		default: SSH auth method: private key
		default: 
		default: Vagrant insecure key detected. Vagrant will automatically replace
		default: this with a newly generated keypair for better security.
		default: 
		default: Inserting generated public key within guest...
		default: Removing insecure key from the guest if it's present...
		default: Key inserted! Disconnecting and reconnecting using new SSH key...
	==> default: Machine booted and ready!
	==> default: Checking for guest additions in VM...
		default: The guest additions on this VM do not match the installed version of
		default: VirtualBox! In most cases this is fine, but in rare cases it can
		default: prevent things such as shared folders from working properly. If you see
		default: shared folder errors, please make sure the guest additions within the
		default: virtual machine match the version of VirtualBox you have installed on
		default: your host and reload your VM.
		default: 
		default: Guest Additions Version: 6.0.10
		default: VirtualBox Version: 6.1
	==> default: Mounting shared folders...
		default: /vagrant => /Users/sab/Desktop/Code/42/IoT/test/vagrant_getting_started

	➜  vagrant_getting_started git:(master) ✗ vagrant ssh

	Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 4.15.0-58-generic x86_64)

	* Documentation:  https://help.ubuntu.com
	* Management:     https://landscape.canonical.com
	* Support:        https://ubuntu.com/advantage

	System information as of Fri Aug 26 08:28:42 UTC 2022

	System load:  0.01              Processes:           91
	Usage of /:   2.5% of 61.80GB   Users logged in:     0
	Memory usage: 11%               IP address for eth0: 10.0.2.15
	Swap usage:   0%

	* Super-optimized for small spaces - read how we shrank the memory
	footprint of MicroK8s to make it the smallest full K8s around.

	https://ubuntu.com/blog/microk8s-memory-optimisation

	0 packages can be updated.
	0 updates are security updates.


	vagrant@vagrant:~$ logout

	Connection to 127.0.0.1 closed.

	➜  vagrant_getting_started git:(master) ✗ vagrant destroy
	
		default: Are you sure you want to destroy the 'default' VM? [y/N] y
	==> default: Forcing shutdown of VM...
	==> default: Destroying VM and associated drives...

	➜  vagrant_getting_started git:(master) ✗ vagrant box list
	
	hashicorp/bionic64        (virtualbox, 1.0.282)

	➜  vagrant_getting_started git:(master) ✗ vagrant box remove hashicorp/bionic64

	Removing box 'hashicorp/bionic64' (v1.0.282) with provider 'virtualbox'...

### Synchronize Local and Guest Files

	➜  vagrant_getting_started git:(master) ✗ vagrant ssh
	...

	vagrant@vagrant:~$ ls /vagrant
	... synced folder

### Share an Environment

	➜  vagrant_getting_started git:(master) ✗ vagrant plugin install vagrant-share

	Installing the 'vagrant-share' plugin. This can take a few minutes...
	Fetching netrc-0.11.0.gem
	Fetching unf_ext-0.0.8.2.gem
	Building native extensions. This could take a while...
	Fetching unf-0.1.4.gem
	Fetching domain_name-0.5.20190701.gem
	Fetching http-cookie-1.0.5.gem
	Fetching http-accept-1.7.0.gem
	Fetching rest-client-2.1.0.gem
	Fetching vagrant-share-2.0.0.gem
	Installed the plugin 'vagrant-share (2.0.0)'!

	
	➜  vagrant_getting_started git:(master) ✗ vagrant share

	The executable 'ngrok' Vagrant is trying to run was not found
	in the PATH variable. The 'ngrok' executable is required to
	run Vagrant share. If 'ngrok' is currently installed in a
	non-standard location, append that location to the PATH
	variable and run this command again. If 'ngrok' is not
	currently installed, it can be downloaded from the ngrok
	website:

	https://ngrok.com/download

	on success

	##... output truncated ...
	==> default: Creating Vagrant Share session...
	==> default: HTTP URL: http://b1fb1f3f.ngrok.io
	##... output truncated ...


### Rebuild an Environment

	➜  vagrant_getting_started git:(master) ✗ vagrant up

	Bringing machine 'default' up with 'virtualbox' provider...
	==> default: Checking if box 'hashicorp/bionic64' version '1.0.282' is up to date...
	==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`
	==> default: flag to force provisioning. Provisioners marked to run always will still run.


### Suspend the machine

	➜  vagrant_getting_started git:(master) ✗ vagrant suspend

	==> default: Saving VM state and suspending execution...

### Halt the machine

	➜  vagrant_getting_started git:(master) ✗ vagrant halt 
	
	==> default: Discarding saved state of VM...


## Networking and Provisioning Environments

### Provision a Virtual Machine

https://learn.hashicorp.com/tutorials/vagrant/getting-started-provisioning?in=vagrant/networking-provisioning-operations

Vagrantfile launch setup script:
	
	config.vm.provision :shell, path: "bootstrap.sh"


### Configure the Network

Vagrantfile port forwarding: 
	
	config.vm.network :forwarded_port, guest: 80, host: 4567


Reload

	➜  vagrant_getting_started git:(master) ✗ vagrant reload

	==> default: Attempting graceful shutdown of VM...
	==> default: Checking if box 'hashicorp/bionic64' version '1.0.282' is up to date...
	==> default: Clearing any previously set forwarded ports...
	==> default: Clearing any previously set network interfaces...
	==> default: Preparing network interfaces based on configuration...
		default: Adapter 1: nat
	==> default: Forwarding ports...
		default: 80 (guest) => 4567 (host) (adapter 1)
		default: 22 (guest) => 2222 (host) (adapter 1)
	==> default: Booting VM...
	==> default: Waiting for machine to boot. This may take a few minutes...
		default: SSH address: 127.0.0.1:2222
		default: SSH username: vagrant
		default: SSH auth method: private key
	==> default: Machine booted and ready!
	==> default: Checking for guest additions in VM...
		default: The guest additions on this VM do not match the installed version of
		default: VirtualBox! In most cases this is fine, but in rare cases it can
		default: prevent things such as shared folders from working properly. If you see
		default: shared folder errors, please make sure the guest additions within the
		default: virtual machine match the version of VirtualBox you have installed on
		default: your host and reload your VM.
		default: 
		default: Guest Additions Version: 6.0.10
		default: VirtualBox Version: 6.1
	==> default: Mounting shared folders...
		default: /vagrant => /Users/sab/Desktop/Code/42/IoT/test/vagrant_getting_started
	==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`
	==> default: flag to force provisioning. Provisioners marked to run always will still run.


	➜  vagrant_getting_started git:(master) ✗ curl http://127.0.0.1:4567

	<!DOCTYPE html>
	<html>
			<body>
					<h1>Get started with Vagrant!</h1>
			</body>
	</html>%  