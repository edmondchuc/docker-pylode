# docker-pylode

## Run

```
# Build docker image.
docker build --no-cache -t pylode .

# Run in the directory of the ontology file.
docker run --rm -it --name pylode -e ONTOLOGY_FILE=tern-org.ttl -e OPTIONS="--css true" -v ${PWD}:/pyLODE/src/pylode/input pylode
```