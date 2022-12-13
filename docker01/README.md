# Docker Session - 01  #

## Install docker on a linux centos distro ##

### Install core lib on linux ###
Note: The chrony service is really important when we start doing distributed cluster
```
sudo dnf -y install epel-release
sudo dnf -y install chrony
sudo dnf -y install firewalld
```
### Start core services ###
```
sudo systemctl start chronyd
sudo systemctl enable chronyd
sudo systemctl start firewalld
sudo systemctl enable firewalld
```

### Add docker repo ###
```
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
```
If the above command doesn't work due to SSL error you might want to add a config to skip
SSL verify, on the linux machine edit this file `/etc/dnf/dnf.conf` and add this like to the file [reference link](https://superuser.com/questions/1057905/adding-no-check-certificate-to-yum-repositories)
```
sslverify=false
```
### Install docker community edition ###
```
sudo dnf -y install docker-ce
```
Some alma version did have libs conflicts, in that case please add `--allowerasing` flag to dnf install like below
```
dnf -y install docker-ce --allowerasing 
```
### Start docker services ###
```
sudo systemctl start docker
sudo systemctl enable docker

sudo systemctl status docker
sudo systemctl status firewalld
sudo systemctl status chronyd
```
When running yum / dnf commands if you are getting UTF error run the below commands
```
dnf install glibc-langpack-en
localectl set-locale LANG=en_US.UTF-8
```