#/bin/bash
#/bin/bash

VERSION=$(cat version)

docker commit hadoop-base segulee/ubuntu-hadoop:${VERSION}
docker push segulee/ubuntu-hadoop:${VERSION}