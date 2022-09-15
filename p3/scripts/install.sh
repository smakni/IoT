#!/bin/bash

echo "** Install Docker **"
wget https://desktop.docker.com/mac/main/amd64/Docker.dmg
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
sudo hdiutil detach /Volumes/Docker

echo "** Install kubectl **"
brew install kubectl

echo "** Install k3d **"
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
