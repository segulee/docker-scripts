/etc/hosts에 추가 필요 </br>
127.0.0.1 localhost kafka </br></br>

버전에 따라 다르지만 spark 연동 시 </br>
```java
    spark-sql-kafka-0-10_2.12-3.0.2.jar
    spark-streaming-kafka-0-10_2.12-3.0.2.jar
    spark-token-provider-kafka-0-10_2.12-3.0.2.jar
    commons-pool2-2.9.0.jar
    kafka-clients-2.7.0.jar
```
jar 들을 SPARK_HOME/jars에 추가 필요. </br>
https://search.maven.org/  </br>
