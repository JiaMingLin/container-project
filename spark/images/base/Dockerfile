FROM robinlin/jre-base:1.8

RUN apt-get update -y

ENV hadoop_ver=hadoop2.6 \
    spark_ver=1.6.2 \
    SPARK_HOME=/opt/spark/ \
    PATH=$PATH:$SPARK_HOME/bin \
    SCALA_TAR_URL=http://www.scala-lang.org/files/archive \
    SCALA_VERSION=2.10.4

#install scala
RUN wget $SCALA_TAR_URL/scala-$SCALA_VERSION.tgz && \
    tar xvf scala-$SCALA_VERSION.tgz && \
    mv scala-$SCALA_VERSION /usr/lib && \
    rm scala-$SCALA_VERSION.tgz && \
    ln -s /usr/lib/scala-$SCALA_VERSION /usr/lib/scala

# Get Spark from US Apache mirror.
RUN mkdir -p /opt && \
    cd /opt && \
    wget http://www-us.apache.org/dist/spark/spark-${spark_ver}/spark-${spark_ver}-bin-${hadoop_ver}.tgz && \
    tar -zvxf spark-${spark_ver}-bin-${hadoop_ver}.tgz && \
    rm spark-${spark_ver}-bin-${hadoop_ver}.tgz && \
    ln -s spark-${spark_ver}-bin-${hadoop_ver} spark && \
    echo Spark ${spark_ver} installed in /opt

ADD log4j.properties /opt/spark/conf/log4j.properties
#ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf
