# Docker Session - 05 #
## Configuration ##
Syntax Example
```yaml
version: '3.9'

services:
  pythonapp:
    image: pythonapp
    build: .
    ports:
      - "80:80"
    environment:
      - DATABASE_URL=postgresql://dbuser:dbpass@db:5432/mydb
    depends_on:
      - db
    network:
      - myappnet
  db:
    image: postgres:12
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_PASSWORD=dbuser
      - POSTGRES_USER=dbpass
      - POSTGRES_DB=mydb
    volumes:
      - pgdata:/var/lib/postgresql/data
    network:
      - myappnet

volumes:
  pgdata: {}

netwokrs:
  myappnet:
    driver: overlay
```
### Services ###
Here service is really the container configuration, every key under services is a container config. Every one of the container key is also used to name the containers
### Volumes and Networks ###
There are different types of volume drives like NFS, XFS etc and the default is local driver

Same way there are different types of networks and the default is bridge network.

Network has multiple purpose like container to container communication, container to user communication etc.

**Bridge:** This is the default network type in Docker. It allows containers to communicate with each other, as well as with the host system.<br><br>
**Host:** This type of network allows containers to use the host system's network stack, and bypass the network isolation provided by the container runtime.<br><br>
**Overlay:** This type of network allows containers running on different Docker daemons to communicate with each other. It is useful for creating multi-host networks in Docker Swarm.<br><br>
**Macvlan:** This type of network allows containers to directly use the host system's physical network interface, and assigns each container a unique MAC address.<br><br>
**None:** This type of network disables all networking for a container.<br><br>
**Network plugins:** Docker also supports various network plugins that allow you to use other networking solutions, such as Weave, Flannel, and Calico.
```yaml
volumes:
  pgdata: {}

netwokrs:
  myappnet:
    driver: overlay
```

### Dependencies ###
Way to define, dependencies from one container to another for example rest api container needs to be depended on the database container
```yaml
services:
  pythonapp:
    image: pythonapp
    depends_on:
      - db
  db:
  image: postgres:12
```
### Environments ###
```yaml
environment:
  - POSTGRES_PASSWORD=dbuser
  - POSTGRES_USER=dbpass
  - POSTGRES_DB=mydb
```
### Deployment ###
```yaml
deploy:
  mode: replicated
  replicas: 1
  placement:
    constraints: [node.hostname == docker-mgr-1]
```
#### **Modes** ####
* **Replicated:** This is the default option. With replicated services, you specify the number of replicas you want to run, and Docker distributes those replicas across the nodes in your swarm.
* **Global**: With global services, you do not specify the number of replicas. Instead, you specify that you want the service to run on every node in the swarm.
* **Local:** With local services, you do not specify the number of replicas. Instead, you specify that you want the service to run on the current node. This can be useful for tasks that need to be run on a specific node, such as node-specific initialization tasks.
#### **Constrains** ####
```yaml
constraints: [node.platform.os == linux]
constraints: [node.hostname == docker-mgr-1]
```
#### **Resources** ####
## Command ##