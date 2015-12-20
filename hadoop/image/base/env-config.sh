#!/bin/bash

useradd hdfs
useradd yarn
useradd mapred
useradd hadoop

hadoop_grp=$(cat /etc/group | grep hadoop)
if [ -z $hadoop_grp ]; then
  groupadd hadoop
fi

usermod -a -G hadoop hdfs
usermod -a -G hadoop yarn
usermod -a -G hadoop mapred
usermod -a -G hadoop hadoop

chown -R hadoop:hadoop /usr/local/hadoop
