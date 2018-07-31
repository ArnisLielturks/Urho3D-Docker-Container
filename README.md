# Urho3D-Docker-Container
Docker container build script to build Urho3D engine. Container can be used later on to build Urho3D projects. 

To see sample check out https://github.com/ArnisLielturks/Urho3D-Empty-Project which uses CircleCI and this Urho3D docker container is used to build it.

Here's my public docker repository which was built this way: https://hub.docker.com/r/arnislielturks/urho3d/

---

## Build process
Run the following command
```
docker build .
```
---

## Tagging docker imgage

```
docker tag $IMAGE_ID $DOCKER_USER/$DOCKER_REPOSITORY_NAME:$TAG
```

Example:
```
docker tag 1b87536d3110 arnislielturks/urho3d:888
```

---
## Pushing to docker hub
```
docker push $DOCKER_USER/$DOCKER_REPOSITORY_NAME:$TAG
```

Example:
```
docker push arnislielturks/urho3d:888
```
