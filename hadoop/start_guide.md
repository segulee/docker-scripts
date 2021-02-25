

## start
```shell
docker exec -it master /bin/bash

start-all.sh
hadoop fs -mkdir -p /user/root
```

## wordcount example
```shell
cd $HADOOP_HOME
hadoop fs -mkdir /input
hadoop fs -put LICENCE.txt /input
hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.0.jar wordcount /input /output
hadoop fs -cat /output/*
```