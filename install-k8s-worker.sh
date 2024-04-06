#!/bin/bash

echo -e "172.31.16.110 master.ethans.com master\n172.31.29.14 worker.ethans.com worker" | sudo tee -a /etc/hosts
sudo apt-get update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start  docker
sudo systemctl status docker
sudo ufw disable
sudo swapoff -a
sudo apt-get install -y apt-transport-https ca-certificates curl gpg 
mkdir -p /etc/apt/keyrings/
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
#sudo apt-get update && sudo apt-get install -y apt-transport-https
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#sudo bash -c 'echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list'
sudo apt-get update && sudo apt-get install -y kubelet kubeadm kubectl
sudo systemctl enable kubelet
sudo systemctl start kubelet