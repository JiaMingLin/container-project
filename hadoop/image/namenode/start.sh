#!/bin/bash

echo "$(hostname -i) hadoop-namenode" >> /etc/hosts
hdfs namenode
