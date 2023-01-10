# Docker Session - 05 #
## Recommended Reading ##
[Raft](https://raft.github.io) <br>
[Docker Swarm](https://docs.docker.com/engine/swarm/)<br>
[Swarm key concepts](https://docs.docker.com/engine/swarm/key-concepts/)
<br>
Swarm's manger worker combination as a recommended number is to keep nodes in odd number and the number of managers will be (n-1)/2

**Example:** <br>
Total 11 Nodes then <br>
(11-1)/2 = 5<br>
So number of recommended manager nodes are 5
## Swarm ##
### Create Swarm ###
```bash
docker swarm init --advertise-addr <MANAGER-IP>
```
### Joining Token ###
Get joining token strings
```bash
docker swarm join-token manager
docker swarm join-token worker
```
### Join Swarm ###

```bash
docker swarm join --token <TOKEN> <MANAGER-IP>:2377
```
### Nodes ###
```bash
docker node ls
```
**Node Status**
* **Blank:** Worker Node
* **Leader:** Active Manager
* **Reachable:** Next in line manager
* **Unavailable:** Manager node not able to communicate with other nodes
* **Drain:** Do not assign/create containers

## Service ##
```bash
# Create a service
docker service create --name mynginx nginx

# Remove a service
docker service rm mynginx

# Create a service with replication
docker service create --replicas 2 --name mynginx nginx
docker service ps mynginx

# Update a service to be 3 replicas
docker service scale mynginx=3
docker service ps mynginx
```
### Rolling Updates ###
```bash
docker service create --replicas 3 --name redis --update-delay 10s redis:6.2.8

# Inspect service 
docker service inspect --pretty redis

# update the image
docker service update --image redis:latest  redis
docker service update --image redis:7.2  redis

# failure action
docker service update --update-failure-action=rollback --image redis:7.2  redis

#rollback
docker service update --rollback  redis
```

### Drain a node ###
```bash
docker node update --availability drain <NODE NAME>

# reverse of drain
docker node update --availability active <NODE NAME>
```

### Promoting a node ###
ssh to the right node and run
```bash
docker node promote
```

### Mode ###
Replicated vs Global
```bash
```

### Additional Notes ###
**Tasks:** A task is nothing but a container, just the terminology used when things are in swwarm mode and managed as a service