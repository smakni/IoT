#!/bin/sh

brew install vagrant -y

vagrant plugin install vargrant-vbguest

sudo mkdir /etc/vbox
sudo touch /etc/vbox/networks.conf
echo "* 10.0.0.0/8 192.168.0.0/16" | sudo tee /etc/vbox/networks.conf

echo "install vagrant complete.\nYou can now run 'vagrant up'!"