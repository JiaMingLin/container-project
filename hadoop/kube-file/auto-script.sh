#!/bin/bash


KUBECTL="/usr/bin/kubectl"
start_hadoop(){
    # start namenode replication controller
    $KUBECTL create -f namenode-rc.yaml
   
    # start namenode service layer
    $KUBECTL create -f namenode-svc.yaml    
    $KUBECTL create -f namenode-http-svc.yaml

    # start datanode replication controller
    $KUBECTL create -f datanode-rc.yaml

}


stop_hadoop(){

    # stop namenode replication controller
    $KUBECTL delete rc hadoop-namenode-rc

    # stop namenode services
    $KUBECTL delete svc hadoop-namenode
    $KUBECTL delete svc hadoop-webhdfs

    # stop datanode rc
    $KUBECTL delete rc hadoop-datanode-rc

}


command=${1}
case ${command} in 
   start)
      echo "Strat Hadoop-HDFS service."
      start_hadoop
      ;; 
   stop)
      echo "Stop Hadoop-HDFS service."
      stop_hadoop
      ;; 
   *)  
      echo "`basename ${0}`:usage: [start] | [stop]" 
      exit 1 # Command to come out of the program with status 1
      ;; 
esac
