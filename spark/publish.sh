#/bin/bash

VERSION=$(cat version)

docker commit hadoop-base segulee/hadoop-spark:${VERSION}
docker push segulee/hadoop-spark:${VERSION}