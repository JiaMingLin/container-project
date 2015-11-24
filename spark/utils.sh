#!/bin/bash

# start the spark service 
function start_spark(){

  # TODO get the spark-master FQDN

  # TODO replace the spark master FQDN in the spark master Replication-Controller while it is creating

  # TODO replace the spark master FQDN in the spark worker Replication-Controller while it is creating
  
  # create the spark master replication-controller
  kubectl create -f spark-master-rc.yaml
  sleep 10 
  kubectl create -f spark-master-svc.yaml
  kubectl create -f spark-history-svc.yaml
  # create the spark worker replication-controller
  kubectl create -f spark-worker-rc.yaml
   
  # create the zeppelin service
  kubectl create -f zeppelin-rc.yaml
  kubectl create -f zeppelin-svc.yaml
}

function stop_spark(){
  # TODO the nsame of rc and svc should be variables.
  kubectl delete rc spark-master-robin-rc
  kubectl delete svc spark-master-svc
  kubectl delete svc spark-history-svc
  kubectl delete rc spark-worker-robin-rc
  
  kubectl delete rc  zeppelin-controller
  kubectl delete svc zeppelin
}
