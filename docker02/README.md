# Docker Session - 02  #
## info ##
Prints all the information about docker daemon and docker node
```
docker info
```

## Containers ##
* To build containers, we need an docker image
### Process ###
* download image from registry if one doesn't exist on host
* build container
* assign unique ID to container
* start the container
```
docker run <IMAGE NAME>
docker run <REPO>/<IMAGE NAME>
```
### run ###
Docker run created a new container
```
docker run centos
docker run ubuntu

# Adding a human readable name to the container
docker run --name my_container ubuntu
```
Running container in interactive mode
```
docker run -it ubuntu bash

# you can run linux commands here inside the node for example to install htop command you can run
apt-get update
apt-get install htop
```
### Running conatiner in detached mode ###
```
docker run -d ubuntu
```

### List containers ###
[Container states Quick Read](https://www.baeldung.com/ops/docker-container-states)
```
# shows all running containers
docker container ls

# shows all containers state like running, exited, dead etc
docker container ls -a
```
### Inspecting a container ###
```
docker container inspect <ID>
```


### Removing a container ####
```
docker container rm <ID>
```
### Attach terminal to a exited container ###
```
docker container start -ai <ID>
```
### Attach terminal to a running container ###
```
docker container attach <ID>
```
### Start, Stop and restart container ###
```
docker run nginx
docker container start <ID>
docker container stop <ID>
docker container restart <ID>
```

### Container Logs ###
```
docker container logs <ID>
```
### Live monitoring like htop/top on linux ###
```
docker container stats <ID>
```
### Creating an image from container ###
```
docker container commit <ID>
```