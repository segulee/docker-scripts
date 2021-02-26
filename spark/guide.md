
sudo vim /etc/hosts
127.0.0.1 localhost master


wget https://downloads.apache.org/spark/spark-3.0.2/spark-3.0.2-bin-hadoop2.7.tgz
tar -zxf spark-3.0.2-bin-hadoop2.7.tgz
mv spark-3.0.2-bin-hadoop2.7 /spark


vim ~/.bashrc
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
export SPARK_HOME=/spark
export PATH=$PATH:$SPARK_HOME/bin