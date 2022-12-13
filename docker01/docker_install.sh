#!/usr/bin/env bash

# Install core lib on linux
sudo dnf -y install epel-release
sudo dnf -y install chrony
sudo dnf -y install firewalld

# Start core services
sudo systemctl start chronyd
sudo systemctl enable chronyd
sudo systemctl start firewalld
sudo systemctl enable firewalld

# Add docker repo
# If the below command doesn't work due to SSL error you might want to add a config to skip
# SSL verify, on the linux machine edit this file /etc/dnf/dnf.conf and add this like to the file
# sslverify=false
# reference link https://superuser.com/questions/1057905/adding-no-check-certificate-to-yum-repositories
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

# Install docker community edition
sudo dnf -y install docker-ce

# Some alma version did have libs conflicts, in that case please add --allowerasing flag to dnf install like below
# dnf -y install docker-ce --allowerasing 

#Start docker services
sudo systemctl start docker
sudo systemctl enable docker

sudo systemctl status docker
sudo systemctl status firewalld
sudo systemctl status chronyd