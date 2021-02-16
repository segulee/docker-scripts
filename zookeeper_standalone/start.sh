#/bin/bash
PWD=${PWD}

docker run -d\
	--name zookeeper \
	-v /etc/localtime:/etc/localtime:ro \
	-v ${PWD}/conf/zoo.cfg:/conf/zoo.cfg \
	-v ${PWD}/logs/zookeeper.log:/logs/zookeeper.log \
	-v ${PWD}/data/:/data \
    -v ${PWD}/datalog/:/datalog \
	--net=elk \
	-p 2181:2181 \
	-p 8080:8080 \
	-p 2888:2888 \
	-p 3888:3888 \
	zookeeper:latest
