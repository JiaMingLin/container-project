#!/bin/bash

# Copyright 2015 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#export ZEPPELIN_HOME=/opt/zeppelin
#export ZEPPELIN_CONF_DIR="${ZEPPELIN_HOME}/conf"

export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin

#if [ -n "${NAMENODE}" ]; then
#   echo "${NAMENODE} namenode" >> /etc/hosts
#fi

#if [ -n "${ZEPPELIN_NOTEBOOK_S3_USER}" ]; then   
#  sed -i "s/ZEPPELIN_NOTEBOOK_S3_USER/${ZEPPELIN_NOTEBOOK_S3_USER}/g" /opt/zeppelin/conf/zeppelin-site.xml
#  sed -i "s/ZEPPELIN_NOTEBOOK_S3_BUCKET/${ZEPPELIN_NOTEBOOK_S3_BUCKET}/g" /opt/zeppelin/conf/zeppelin-site.xml
#  sed -i "s/AWS_KEY_ID/${AWS_KEY_ID}/g" /root/.aws/credentials
#  sed -i "s~AWS_SECRET_KEY~${AWS_SECRET_KEY}~g" /root/.aws/credentials
#fi

echo "=== Launching Zeppelin under Docker ==="
/opt/zeppelin/bin/zeppelin.sh
