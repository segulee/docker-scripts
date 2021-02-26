pip install pyarrow

OSError: Unable to load libjvm: /usr/java/latest//lib/server/libjvm.so: cannot open shared object file: No such file or directory

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl openssh-server rsync wget vim iputils-ping htop openjdk-8-jdk


docker cp master:/usr/local/hadoop/lib/native/libhdfs.so.0.0.0 ./

sudo mv libhdfs.so.0.0.0 /usr/lib
sudo ln -s /usr/lib/libhdfs.so.0.0.0 /usr/lib/libhdfs.so
export ARROW_LIBHDFS_DIR=$ARROW_LIBHDFS_DIR:/usr/lib/
export CLASSPATH=`$HADOOP_HOME/bin/hdfs classpath --glob`