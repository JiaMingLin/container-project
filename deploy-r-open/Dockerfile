FROM robinlin/base-lite:java1.8
MAINTAINER robin robin890650@gmail.com

ENV RRO_VERSION_MAJOR 3
ENV RRO_VERSION_MINOR 2.2
ENV DEPLOYR_VERSION_MAJOR 8
ENV DEPLOYR_VERSION_MINOR 0.0
ENV RSERVER_VERSION_MAJOR 7
ENV RSERVER_VERSION_MINOR 4.1

RUN yum clean all && \
    yum update -y && \
    yum install wget -y

# Download Revolution-R Open
RUN wget https://mran.revolutionanalytics.com/install/RRO-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}.el6.x86_64.rpm

# Download MKL
RUN wget https://mran.revolutionanalytics.com/install/RevoMath-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}.tar.gz

# Install RRO
RUN yum install RRO-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}.el6.x86_64.rpm -y && \
    rm -rf RRO-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}.el6.x86_64.rpm
RUN sed -i "4s/.*/R_HOME_DIR=\/usr\/lib64\/RRO-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}\/R-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}\/lib64\/R/g" /usr/lib64/RRO-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}/R-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}/lib64/R/bin/R

# Install MKL
RUN tar -zxvf RevoMath-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}.tar.gz && \
    rm -rf RevoMath-${RRO_VERSION_MAJOR}.${RRO_VERSION_MINOR}.tar.gz
ADD RevoMathConfig.sh /RevoMath/
WORKDIR /RevoMath
RUN ./RevoMathConfig.sh

# Install DeployR Rserver
RUN wget https://github.com/deployr/deployr-rserve/releases/download/v${RSERVER_VERSION_MAJOR}.${RSERVER_VERSION_MINOR}/deployrRserve_${RSERVER_VERSION_MAJOR}.${RSERVER_VERSION_MINOR}.tar.gz && \
    ln -s /usr/lib64/libicuuc.so.42 /usr/lib64/libicuuc.so && \
    ln -s /usr/lib64/libicui18n.so.42 /usr/lib64/libicui18n.so && \
    R CMD INSTALL deployrRserve_${RSERVER_VERSION_MAJOR}.${RSERVER_VERSION_MINOR}.tar.gz && \
    rm -f /deployrRserve_${RSERVER_VERSION_MAJOR}.${RSERVER_VERSION_MINOR}.tar.gz

# Install DeployR Basic
# Add user for deploy-r first
RUN adduser deployr
USER deployr
WORKDIR /home/deployr/

RUN mkdir deployrdownload && \
    wget http://deployr.revolutionanalytics.com/download/bundles/release/DeployR-Open-Linux-${DEPLOYR_VERSION_MAJOR}.${DEPLOYR_VERSION_MINOR}.tar.gz -P deployrdownload
RUN cd deployrdownload && \ 
    tar -zxvf DeployR-Open-Linux-${DEPLOYR_VERSION_MAJOR}.${DEPLOYR_VERSION_MINOR}.tar.gz && \
    rm -rf DeployR-Open-Linux-${DEPLOYR_VERSION_MAJOR}.${DEPLOYR_VERSION_MINOR}.tar.gz
ADD installDeployROpen.sh deployrdownload/installFiles/

USER root
RUN chown deployr:deployr deployrdownload/installFiles/installDeployROpen.sh
USER deployr
RUN cd deployrdownload/installFiles/ && \
    chmod +x installDeployROpen.sh && \
    sync && \
    ./installDeployROpen.sh --no-ask --nolicense
