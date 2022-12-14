# Docker Session - 03 #

## Port Mapping ##

### Map container ports to host ###
#### syntax ####
```
docker run -p <HOST PORT>:<CONTAINER PORT> nginx
```
Example
```
docker run -d -p 80:80 nginx
```
### Open System ports ###
```
firewall-cmd --zone=public --add-port=8080/tcp --permanent
```
on ubuntu based hosts machines use ufw (uncomplicated firewall), ufw is available on centos also
```
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow 8080
ufw enable
```

## Environment Variables ##
```
docker run -e HELLO=WORLD -it ubuntu bash
docker run -e HELLO=WORLD -e JELLY=FISH -it ubuntu bash
```
## Volume ##
#### syntax ####
```
docker run -v <HOST DIRECTORY>:<CONTAINER DIRECTORY> ubuntu
```
Example
```
docker run -v /tmp/host:/tmp/container -it ubuntu bash
```

## Spin a postgres database with persistant volume ##
```
docker run -p 5432:5432 -d \
-v pgdata:/var/lib/postgresql/data \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_DB=jellyfish \
postgres
```
connect to postgres DB
```
docker container exec -it <ID> psql -U postgres jellyfish
```
List all DB's
```
\l
```
Create a table in DB
```
CREATE TABLE people (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255));
```
List all tables
```
\dt
```
On disk deafult volume location
```
/var/lib/docker/volumes
```
## Custom volume mapping ##
Creating docker volume to local disk with custom path

```
docker volume create test -d local \
--opt device=/tmp/mydir \
--opt type=none \
--opt o=bind
```
Regarding creation of volume with other mounts such as nfs please refer to this [Additional Read](https://docs.docker.com/engine/reference/commandline/volume_create/)

### Mounting persistant disk to custom path ###
```
docker run -d -p 5432:5432 \
--mount source=test,target=/var/lib/postgresql/data \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_DB=jellyfish \
postgres
```