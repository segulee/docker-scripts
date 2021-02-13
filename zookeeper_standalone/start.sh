#/bin/bash

docker run -d\
	--name zookeeper \
	-v /etc/localtime:/etc/localtime:ro \
	-v /home/segu/segu_dev/docker_dev/zookeeper/conf/zoo.cfg:/conf/zoo.cfg \
	-v /home/segu/segu_dev/docker_dev/zookeeper/logs/zookeeper.log:/logs/zookeeper.log \
	-v /home/segu/segu_dev/docker_dev/zookeeper/data/:/data \
    -v /home/segu/segu_dev/docker_dev/zookeeper/datalog/:/datalog \
	--net=elk \
	-p 2181:2181 \
	-p 8080:8080 \
	-p 2888:2888 \
	-p 3888:3888 \
	zookeeper:latest
