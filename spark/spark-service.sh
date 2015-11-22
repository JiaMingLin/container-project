#!/bin/bash

# specify the action is "start" or "stop"
action=$1

if [[ $action = '' ]] || [[ "$action" != "start" && "$action" != "stop" ]]; then
  echo "Usage spark-service.sh [start|stop] "
fi

source utils.sh

if [[ "$action" == "start" ]]; then
  echo "Start the Spark service..."
  start_spark

elif [[ "$action" == "stop" ]]; then
  echo "Stop the spark service..."
  stop_spark

fi

