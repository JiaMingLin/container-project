FROM ubuntu:14.04
MAINTAINER robin robin890650@gmail.com

RUN apt-get update -y && \
    apt-get dist-upgrade -y --force-yes && \
    apt-get install -y --force-yes wget

ENV JAVA_VER=8u91 \
    JRE_VER=1.8.0_91 \
    BUILD_VER=b14
# install java
RUN mkdir /usr/share/java &&\
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VER}-${BUILD_VER}/jre-${JAVA_VER}-linux-x64.tar.gz
RUN /bin/tar -zxvpf /jre-${JAVA_VER}-linux-x64.tar.gz -C /usr/share/java/
RUN rm -f /jre-${JAVA_VER}-linux-x64.tar.gz

ENV JAVA_HOME /usr/share/java/jre${JRE_VER}
ENV PATH $PATH:$JAVA_HOME/bin
