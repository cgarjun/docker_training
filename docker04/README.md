# Docker Session - 04 #
## Dockerfile ##
Syntax
|Command|Arguments|
|-|-|
|FROM|ubuntu|
|FROM|python:3.10-alpine|
|RUN|pip3 install -r requirements.txt|

## Commands ##
#### FROM ####
> Initializes a new build stage and sets the base image
#### RUN ####
> Execute any command in a new layer on top of current image and commit
```docker
# RUN <COMMAND>
# or
# RUN [cmd, arg1, arg2]
RUN pip install -r requirements.txt
```
#### CMD ####
> Default command to run when user doesn't pass a command when starting container
```docker
# CMD [cmd, arg1, arg2]
```
#### ENTRYPOINT ####
Entrypoint is very similar to CMD, the key difference is when user passes command that's treated as an argument to Entrypoint rather than as a command
```docker
ENTRYPOINT [ "echo" ,"hello world"]
$ hello world
```
if container run like `docker run <IMAGE TAG> jellyfish pictures`
then the result for ENTRYPOINT would be like
```docker
$ hello world jellyfish pictures
```
#### COPY ####
Copy files to image
```docker
# COPY <SOURCE> <DESTINATION>
COPY . .
COPY app /data/app
```
#### ADD ####
Copy direcotry and also capable of running commands like run.
Recommend not to use this unless, its really necessary, all work should be doable with COPY and RUN, this is good to know for legacy reasons.
#### ENV ####
```docker
ENV hello "world"
```
#### USER ####
#### WORKDIR ####
This is only important when you want to deal with relative paths for some reasons. This is equivalent to setting current working directory in python
```docker
RUN mkdir /code
WORKDIR /code
```
#### EXPOSE ####
Exposes a port from container
```docker
EXPOSE 8000/tcp
```

## Build Image ##
Syntax
```
docker build -t <IMAGE TAG>
```
Example
```
docker build --rm -t myimage
```
## Run Image ##
```
docker run -it myimage
```
## Image history ##
```
docker image history myimage
```
## Add to docker registry ##
```
docker login
```
```
docker push <IMAGE TAG>
```