
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


## image commands flowchart

설치 라이브러리
```shell
apt-get update; apt-get upgrade -y; apt-get install -y curl openssh-server rsync wget vim iputils-ping htop openjdk-8-jdk
```

하둡 설치
```shell
wget http://mirror.navercorp.com/apache/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
tar -zxvf hadoop-3.3.0.tar.gz
rm hadoop-3.3.0.tar.gz
mv ./hadoop-3.3.0 /usr/local/hadoop
```

하둡 node 설정
```shell
cd /usr/local/hadoop/
mkdir -p hadoop_tmp/hdfs/namenode
mkdir -p hadoop_tmp/hdfs/datanode
chmod 777 hadoop_tmp/
```

bashrc 수정
```shell
vim ~/.bashrc

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export PATH=$PATH:$JAVA_HOME/bin
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
```

bashrc 적용
```
source ~/.bashrc
```

hadoop-env.sh 설정
```shell
vim $HADOOP_HOME/etc/hadoop/hadoop-env.sh

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'

export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export YARN_NODEMANAGER_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="${HADOOP_OPTS} -Djava.library.path=$HADOOP_HOME/lib"
```

core-site.xml 설정
```shell
vim $HADOOP_HOME/etc/hadoop/core-site.xml

<configuration>
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://master:9000</value>
  </property>
</configuration>
```

hdfs-site.xml 설정
```shell
vim $HADOOP_HOME/etc/hadoop/hdfs-site.xml

<configuration>
  <property>
    <name>dfs.replication</name>
    <value>2</value>
  </property>

  <property>
    <name>dfs.permissions</name>
    <value>false</value>
  </property>

  <property>
    <name>dfs.namenode.name.dir</name>
    <value>/usr/loca/hadoop_tmp/hdfs/namenode</value>
  </property>

  <property>
    <name>dfs.datanode.data.dir</name>
    <value>/usr/loca/hadoop_tmp/hdfs/datanode</value>
  </property>

<property>
<name>dfs.webhdfs.enabled</name>
<value>true</value>
</property>

<property>
<name>dfs.namenode.http-address</name>
<value>master:50070</value>
</property>

</configuration>
```

yarn-site.xml 설정
```shell
vim $HADOOP_HOME/etc/hadoop/yarn-site.xml

<configuration>
  <property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
  </property>
  <property>
    <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
    <value>org.apache.hadoop.mapred.ShffleHandler</value>
  </property>
</configuration>
```

mapred-site.xml 설정
```shell
vim $HADOOP_HOME/etc/hadoop/mapred-site.xml
<configuration>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
  <property>
    <name>yarn.app.mapreduce.am.env</name>
    <value>HADOOP_MAPRED_HOME=$HADOOP_HOME</value>
  </property>
  <property>
    <name>mapreduce.map.env</name>
    <value>HADOOP_MAPRED_HOME=$HADOOP_HOME</value>
  </property>
  <property>
    <name>mapreduce.reduce.env</name>
    <value>HADOOP_MAPRED_HOME=$HADOOP_HOME</value>
  </property>
</configuration>
```

ssh 설치
```shell
apt-get install ssh
```

ssh 자동시작 설정
```shell
vim ~/.bashrc
#autorun  
/usr/sbin/sshd
```

ssh 설정
```shell
cd ~/
ssh-keygen -t rsa -P '' -f ~/.ssh/id_dsa
cd .ssh
cat id_dsa.pub >> authorized_keys
cs
```

name node 포맷
```
hdfs namenode-format
```
