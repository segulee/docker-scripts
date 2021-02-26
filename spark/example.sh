# ./spark/bin/spark-submit --class org.apache.spark.examples.SparkPi \
#     --master yarn \
#     --deploy-mode cluster \
#     --driver-memory 4g \
#     --executor-memory 2g \
#     --executor-cores 1 \
#     --queue thequeue \
#     /spark/examples/jars/spark-examples*.jar \
#     10

/spark/bin/spark-submit --class org.apache.spark.examples.SparkPi \
    --master yarn \
    --deploy-mode cluster \
    --driver-memory 4g \
    --executor-memory 2g \
    --executor-cores 1 \
    /spark/examples/jars/spark-examples*.jar \
    10

/spark/bin/spark-submit \
    --master yarn \
    --deploy-mode cluster \
    /spark/examples/src/main/python/pi.py \
    10