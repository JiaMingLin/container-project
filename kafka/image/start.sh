#!/bin/bash

function check_zookeeper {
  COUNTER=0
  echo "Checking Zookeeper status..."
  while [ $COUNTER -lt 10 ]; do
     zookeeper=$(netstat -nlp | grep 2181 | cut -d ' ' -f1)
     if [[ $zookeeper ]]; then
        break
     fi
     sleep 1
     let COUNTER=$COUNTER+1
  done

  if [ -z $zookeeper ]; then
    echo "Zookeeper was not ready."
    exit 1
  fi
}

function check_kafka {
  COUNTER=0
  echo "Checking Kafka status..."
  while [ $COUNTER -lt 10 ]; do
     kafka=$(netstat -nlp | grep 9092 | cut -d ' ' -f1)
     if [[ $kafka ]]; then
 	break       
     fi
     sleep 1
     let COUNTER=$COUNTER+1
  done
  if [ -z $kafka ]; then
     echo "Kafka was not ready."
     exit 1
  fi
}

# Starting zookeeper
$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties > /zookeeper.log &

# Checking zookeeper
check_zookeeper

# Starting Kafka
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties

# Checking Kafka
#check_kafka

#echo "Kafka started."
