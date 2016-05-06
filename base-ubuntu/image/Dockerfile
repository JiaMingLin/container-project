FROM ubuntu:14.04
MAINTAINER robin robin890650@gmail.com

RUN apt-get update -y && \
    apt-get dist-upgrade -y --force-yes && \
    apt-get install -y --force-yes wget

# install java
RUN mkdir /usr/share/java &&\
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
         http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.tar.gz -O ~/jdk-8u66-linux-x64.tar.gz
RUN /bin/tar -zxvpf /root/jdk-8u66-linux-x64.tar.gz -C /usr/share/java/
RUN rm -f /root/jdk-8u66-linux-x64.tar.gz

ENV JAVA_HOME /usr/share/java/jdk1.8.0_66
ENV PATH $PATH:$JAVA_HOME/bin
