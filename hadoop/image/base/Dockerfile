FROM robinlin/base
MAINTAINER robinlin robin890650@gmail.com

RUN yum update -y

ENV hadoop_ver 2.7.1

# download hadoop tar ball
RUN cd /usr/local && \
    wget http://www.us.apache.org/dist/hadoop/common/hadoop-${hadoop_ver}/hadoop-${hadoop_ver}.tar.gz && \
    tar -zxvf hadoop-${hadoop_ver}.tar.gz && \
    mv hadoop-${hadoop_ver} hadoop && \
    rm -f hadoop-${hadoop_ver}.tar.gz

# hadoop env
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH ${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin

# add the configuration and run script
RUN mkdir /root/run-script/
ADD env-config.sh /root/run-script/env-config.sh
RUN chmod +x /root/run-script/*.sh

# configure user and group and set permission
RUN /root/run-script/env-config.sh

# add the core-site.xml and hdfs-site.xml
RUN ln -s ${HADOOP_HOME}/etc/hadoop /etc/hadoop
ADD core-site.xml ${HADOOP_HOME}/etc/hadoop/core-site.xml
ADD hdfs-site.xml ${HADOOP_HOME}/etc/hadoop/hdfs-site.xml

# make dir for hadoop
RUN mkdir -p /hadoop/hdfs/data && \
    mkdir -p /hadoop/hdfs/namenode && \
    mkdir -p /hadoop/hdfs/namesecondary && \
    mkdir -p /var/lib/hadoop-hdfs && \
    chown hdfs:hadoop -R /hadoop/hdfs/

# add hadoop lib
ADD libhadoop.so.1.0.0 $HADOOP_HOME/lib/native/libhadoop.so.1.0.0

# make dirs service lib
RUN mkdir -p /var/lib/hadoop-lib

# formatting the HDFS Filesystem
#RUN yum install which -y && \
#    su hdfs && \
#    hdfs namenode -format && \
#    exit

EXPOSE 1-65000
