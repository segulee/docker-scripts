#/bin/bash

PWD=${PWD}
workers="${1:-2}"
echo $workers workers

HADOOP_HOME="/usr/local/hadoop"

rm -rf masters
rm -rf workers

docker network rm hadoop_net
docker network create --subnet 10.0.2.0/24 hadoop_net

echo master > masters
echo master > workers
i=0
while [ $i -lt $workers ]; do
    i=$(( ${i}+1 ));
    echo slave$i >> workers;
done

addhost="--add-host=master:10.0.2.2";

i=0
while [ $i -lt $workers ]; do
    i=$(( ${i}+1 ));
    j=$(( ${i}/10+1 ));
    addhost="$addhost --add-host=slave${i}:10.0.2.${j}${i}";
done

docker run -itd\
    -h master\
    --name master\
    --network hadoop_net\
    --ip 10.0.2.2\
    -p 50070:50070\
    -p 8088:8088\
    -v ${PWD}/masters:${HADOOP_HOME}/etc/hadoop/masters\
    -v ${PWD}/workers:${HADOOP_HOME}/etc/hadoop/workers\
    ${addhost}\
    segulee/ubuntu-hadoop:1.0.0.4\
    /bin/bash

i=0
while [ $i -lt $workers ]; do
    i=$(( ${i}+1 ));
    j=$(( ${i}/10+1 ));
    docker run -itd\
        -h slave$i\
        --name slave$i\
        --network hadoop_net\
        --ip 10.0.2.${j}${i}\
        -v ${PWD}/masters:${HADOOP_HOME}/etc/hadoop/masters\
        -v ${PWD}/workers:${HADOOP_HOME}/etc/hadoop/workers\
        ${addhost}\
        segulee/ubuntu-hadoop:1.0.0.4\
        /bin/bash
done



# while [ $i -lt $workers ]; do
#     i=$(( ${i}+1 ));
#     echo slave$i >> workers;

# done