#!/bin/bash
INSTALL_FOLDER=/home/deployr/deployr/8.0.0
if [[ -z ${HOST_SERVER_IP} ]]; then
  echo "The public IP is empty, using 'localhost'"
else  
  yes | $INSTALL_FOLDER/deployr/tools/setWebContext.sh -ip ${HOST_SERVER_IP} -disableauto
fi

$INSTALL_FOLDER/mongo/mongod.sh start
$INSTALL_FOLDER/rserve/rserve.sh start
#yes | $INSTALL_FOLDER/deployr/tools/setWebContext.sh -ip 192.168.99.100 -disableauto
$INSTALL_FOLDER/tomcat/tomcat7/bin/catalina.sh run > $INSTALL_FOLDER/tomcat/tomcat7/logs/tomcat.log 2>&1
