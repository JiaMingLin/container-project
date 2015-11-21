#!/bin/bash

# start the spark service 
function start_spark(){
  # create the spark service first
  kubectl create -f spark-master-svc.yaml

  # TODO get the spark-master FQDN

  # TODO replace the spark master FQDN in the spark master Replication-Controller while it is creating

  # TODO replace the spark master FQDN in the spark worker Replication-Controller while it is creating
  
  # create the spark master replication-controller
  kubectl create -f spark-master-rc.yaml
  
  # create the spark worker replication-controller
  kubectl create -f spark-worker-rc.yaml
}

function stop_spark(){
  # TODO the nsame of rc and svc should be variables.
  kubectl delete rc spark-master-robin-rc
  kubectl delete svc spark-master-svc
  kubectl delete rc spark-worker-robin-rc
}
