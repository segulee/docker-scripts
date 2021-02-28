#/bin/bash

PWD=${PWD}
workers="${1:-2}"
echo $workers workers

VERSION=$(cat version)
HADOOP_HOME="/usr/local/hadoop"
NETWORK="hadoop_net"
NETWORK_BASE="11.0.2"
IMAGE="segulee/ubuntu-hadoop:${VERSION}"

rm -rf masters
rm -rf workers

docker network rm hadoop_net
docker network create --subnet "${NETWORK_BASE}.0/24" ${NETWORK}

echo master > masters
echo master > workers
i=0
while [ $i -lt $workers ]; do
    i=$(( ${i}+1 ));
    echo slave$i >> workers;
done

addhost="--add-host=master:${NETWORK_BASE}.2";

i=0
while [ $i -lt $workers ]; do
    i=$(( ${i}+1 ));
    j=$(( ${i}/10+1 ));
    addhost="$addhost --add-host=slave${i}:${NETWORK_BASE}.${j}${i}";
done

docker run -itd\
    -h master\
    --name master\
    --network ${NETWORK}\
    --ip ${NETWORK_BASE}.2\
    -p 50070:50070\
    -p 8088:8088\
    -v ${PWD}/masters:${HADOOP_HOME}/etc/hadoop/masters\
    -v ${PWD}/workers:${HADOOP_HOME}/etc/hadoop/workers\
    ${addhost}\
    ${IMAGE}\
    /bin/bash

i=0
while [ $i -lt $workers ]; do
    i=$(( ${i}+1 ));
    j=$(( ${i}/10+1 ));
    docker run -itd\
        -h slave$i\
        --name slave$i\
        --network ${NETWORK}\
        --ip ${NETWORK_BASE}.${j}${i}\
        -v ${PWD}/masters:${HADOOP_HOME}/etc/hadoop/masters\
        -v ${PWD}/workers:${HADOOP_HOME}/etc/hadoop/workers\
        ${addhost}\
        ${IMAGE}\
        /bin/bash
done



# while [ $i -lt $workers ]; do
#     i=$(( ${i}+1 ));
#     echo slave$i >> workers;

# done