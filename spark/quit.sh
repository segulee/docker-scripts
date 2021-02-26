#/bin/bash

# docker rm -f $(cat masters)

for val in "$(cat workers)"; do
    docker rm -f ${val}
done