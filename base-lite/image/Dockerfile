FROM centos:6.6

MAINTAINER robin robin890650@gmail.com

RUN yum update -y
RUN yum install wget tar -y

# install java
RUN mkdir /usr/share/java &&\
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
         http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.tar.gz -O ~/jdk-8u66-linux-x64.tar.gz
RUN /bin/tar -zxvpf /root/jdk-8u66-linux-x64.tar.gz -C /usr/share/java/
RUN rm -f /root/jdk-8u66-linux-x64.tar.gz

ENV JAVA_HOME /usr/share/java/jdk1.8.0_66
ENV PATH $PATH:$JAVA_HOME/bin
