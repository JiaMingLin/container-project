FROM jiaming/base

RUN yum update -y

ENV hadoop_ver 2.6.1
ENV spark_ver 1.5.1
ENV SPARK_HOME /opt/spark/
ENV SCALA_TAR_URL http://www.scala-lang.org/files/archive
ENV SCALA_VERSION 2.10.4

#install scala
RUN wget $SCALA_TAR_URL/scala-$SCALA_VERSION.tgz
RUN tar xvf scala-$SCALA_VERSION.tgz
RUN mv scala-$SCALA_VERSION /usr/lib
RUN rm scala-$SCALA_VERSION.tgz
RUN ln -s /usr/lib/scala-$SCALA_VERSION /usr/lib/scala

# Get Hadoop from US Apache mirror and extract just the native
# libs. (Until we care about running HDFS with these containers, this
# is all we need.)
RUN mkdir -p /opt && \
    cd /opt && \
    wget http://www.us.apache.org/dist/hadoop/common/hadoop-${hadoop_ver}/hadoop-${hadoop_ver}.tar.gz && \
    tar -zvxf hadoop-${hadoop_ver}.tar.gz hadoop-${hadoop_ver}/lib/native && \
    rm hadoop-${hadoop_ver}.tar.gz && \
    ln -s hadoop-${hadoop_ver} hadoop && \
    echo Hadoop ${hadoop_ver} native libraries installed in /opt/hadoop/lib/native

# Get Spark from US Apache mirror.
RUN mkdir -p /opt && \
    cd /opt && \
    wget http://www.us.apache.org/dist/spark/spark-${spark_ver}/spark-${spark_ver}-bin-hadoop2.6.tgz && \
    tar -zvxf spark-${spark_ver}-bin-hadoop2.6.tgz && \
    rm spark-${spark_ver}-bin-hadoop2.6.tgz && \
    ln -s spark-${spark_ver}-bin-hadoop2.6 spark && \
    echo Spark ${spark_ver} installed in /opt

# Add the GCS connector.
#RUN wget -O /opt/spark/lib/gcs-connector-latest-hadoop2.jar https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar

# TODO Do we need to add S3 and Swift connector here?

ADD log4j.properties /opt/spark/conf/log4j.properties
