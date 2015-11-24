#!/bin/bash

ACCOUNT=robinlin
SPARK_TAG=1.5.1
ZEPPELIN_TAG=0.5.5

# build images
docker build -t $ACCOUNT/spark-base base
docker build -t $ACCOUNT/spark-master master
docker build -t $ACCOUNT/spark-worker worker
docker build -t $ACCOUNT/zeppelin zeppelin

# make tag
docker tag $ACCOUNT/spark-base $ACCOUNT/spark-base:$SPARK_TAG
docker tag $ACCOUNT/spark-master $ACCOUNT/spark-master:$SPARK_TAG
docker tag $ACCOUNT/spark-worker $ACCOUNT/spark-worker:$SPARK_TAG
docker tag $ACCOUNT/zeppelin $ACCOUNT/zeppelin:$ZEPPELIN_TAG

# push
docker push $ACCOUNT/spark-base:$SPARK_TAG
docker push $ACCOUNT/spark-master:$SPARK_TAG
docker push $ACCOUNT/spark-worker:$SPARK_TAG
docker push $ACCOUNT/zeppelin:$ZEPPELIN_TAG

# clean
docker rmi -f $ACCOUNT/spark-base:$SPARK_TAG
docker rmi -f $ACCOUNT/spark-master:$SPARK_TAG
docker rmi -f $ACCOUNT/spark-worker:$SPARK_TAG
docker rmi -f $ACCOUNT/zeppelin:$ZEPPELIN_TAG
