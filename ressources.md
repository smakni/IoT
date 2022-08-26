# Ressources

## Links

https://app.vagrantup.com/centos/boxes/7

## Commands

remove all

	vagrant box list | cut -f 1 -d ' ' | xargs -L 1 vagrant box remove -f