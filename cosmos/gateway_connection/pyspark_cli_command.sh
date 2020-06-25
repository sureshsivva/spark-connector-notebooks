#!/usr/bin/env bash


#pyspark cli command to invoke a spark session with the azure-cosmos connector dependencies

#check the need to enable spark.driver.userClassPathFirst & spark.executor.userClassPathFirst
#if cluster and cosmos dependencies have conflicts and you want cosmos dependencies preferred

#in my case I added spark-cosmos connector, cosmos-documentdb, uuid generator & http client libs

pyspark2 --master yarn \
         --conf "spark.driver.userClassPathFirst=true" \
         --conf "spark.executor.userClassPathFirst=true" \
         --conf "spark.dyanmicAllocation.enabled=true" \
         --conf "spark.dynamicAllocation.maxExecutors=25" \
         --executor-memory 8g \
         --executor-cores 4 \
         --driver-memory 4g \
         --driver-cores 1 \
         --queue queue_name \
         --jars "hdfs://CLUSTER/path/to/jars/azure-cosmosdb-spark_2.4.0_2.11-3.0.5.jar,hdfs://CLUSTER/path/to/jars/azure-documentdb-2.4.7.jar,hdfs://CLUSTER/path/to/jars/java-uuid-generator-4.0.1.jar,hdfs://CLUSTER/path/to/jars/httpclient-4.5.12.jar"