FROM robinlin/hadoop:2.7.1

RUN apt-get update -y

ENV hadoop_ver 2.7.1
ENV spark_ver 1.6.1
ENV SPARK_HOME /opt/spark/
ENV SCALA_TAR_URL http://www.scala-lang.org/files/archive
ENV SCALA_VERSION 2.10.4

#install scala
RUN wget $SCALA_TAR_URL/scala-$SCALA_VERSION.tgz && \
    tar xvf scala-$SCALA_VERSION.tgz && \
    mv scala-$SCALA_VERSION /usr/lib && \
    rm scala-$SCALA_VERSION.tgz && \
    ln -s /usr/lib/scala-$SCALA_VERSION /usr/lib/scala

# Get Spark from US Apache mirror.
RUN mkdir -p /opt && \
    cd /opt && \
    wget http://www-us.apache.org/dist/spark/spark-${spark_ver}/spark-${spark_ver}-bin-without-hadoop.tgz && \
    tar -zvxf spark-${spark_ver}-bin-without-hadoop.tgz && \
    rm spark-${spark_ver}-bin-without-hadoop.tgz && \
    ln -s spark-${spark_ver}-bin-without-hadoop spark && \
    echo Spark ${spark_ver} installed in /opt

ADD log4j.properties /opt/spark/conf/log4j.properties
ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf
ENV PATH $PATH:/opt/spark/bin
