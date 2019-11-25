# docker-pylode

## Run

```
# Build docker image.
docker build --no-cache -t pylode .

# Note the ONTOLOGY_FILE environment variable. This is the file name. 
# The OPTIONS environment variable sets the options for pylode. 

# Run in the directory of the ontology file.
docker run --rm -it --name pylode -e ONTOLOGY_FILE=tern-org.ttl -e OPTIONS="--css true" -v ${PWD}:/pyLODE/src/pylode/input pylode
```

## Run from Docker Hub
```
docker run --rm -it --name pylode -e ONTOLOGY_FILE=tern-org.ttl -e OPTIONS="--css true" -v ${PWD}:/pyLODE/src/pylode/input edmondchuc/pylode
```