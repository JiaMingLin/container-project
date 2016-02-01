FROM centos:6.6

MAINTAINER robin robin890650@gmail.com

# Install the neccessary packages
RUN yum -y clean all && \
    yum -y install git wget unzip curl net-tools build-essential npm python python-setuptools python-dev python-numpy tar

#ADD ssh/* /root/.ssh/

RUN mkdir /usr/share/java &&\
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
         http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.tar.gz -O ~/jdk-8u66-linux-x64.tar.gz
RUN /bin/tar -zxvpf /root/jdk-8u66-linux-x64.tar.gz -C /usr/share/java/

ENV JAVA_HOME /usr/share/java/jdk1.8.0_66
ENV PATH $PATH:$JAVA_HOME/bin

# Maven
ENV MAVEN_VERSION 3.3.1
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O ~/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN tar -zxvpf /root/apache-maven-$MAVEN_VERSION-bin.tar.gz -C /usr/share/

ENV MAVEN_HOME /usr/share/apache-maven-$MAVEN_VERSION
ENV PATH $PATH:$MAVEN_HOME/bin

RUN ln -s $MAVEN_HOME /usr/share/maven
