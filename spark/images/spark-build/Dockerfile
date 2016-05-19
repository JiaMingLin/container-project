from robinlin/jdk-base
MAINTAINER robin robin890650@gmail.com


ENV SCALA_MAJOR_VAR=2  \
    SCALA_MINOR_VAR=11.8  \
    SPARK_MAJOR_VAR=1  \
    SPARK_MINOR_VAR=6.1

RUN apt-get update -y && \
    apt-get dist-upgrade -y --force-yes && \
    apt-get install -y --force-yes git

# install scala
RUN mkdir /usr/share/scala && \
    wget http://downloads.lightbend.com/scala/${SCALA_MAJOR_VAR}.${SCALA_MINOR_VAR}/scala-${SCALA_MAJOR_VAR}.${SCALA_MINOR_VAR}.tgz -O ~/scala-${SCALA_MAJOR_VAR}.${SCALA_MINOR_VAR}.tgz && \
    /bin/tar -zxvpf /root/scala-${SCALA_MAJOR_VAR}.${SCALA_MINOR_VAR}.tgz -C /usr/share/scala/ && \
    rm -f /root/scala-${SCALA_MAJOR_VAR}.${SCALA_MINOR_VAR}.tgz

ENV SCALA_HOME=/usr/share/scala/scala-${SCALA_MAJOR_VAR}.${SCALA_MINOR_VAR}  \
    PATH=$PATH:SCALA_HOME/bin

VOLUME ["/root/workspace"]
