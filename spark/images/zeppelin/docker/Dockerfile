FROM robinlin/jre-base:1.8
MAINTAINER robin robin890650@gmail.com

# python install
RUN apt-get update && \
    apt-get install software-properties-common -y --force-yes && \
    add-apt-repository ppa:fkrull/deadsnakes && \
    apt-get install git g++ libopenblas-dev python-pandas python-numpy python-scipy python-pip libatlas-base-dev gfortran python-dev python-matplotlib -y --force-yes && \
    pip install scikit-learn

ADD r_key.txt /r_key.txt
# R install
RUN sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' && \
    gpg --import /r_key.txt && \
    gpg -a --export E084DAB9 | sudo apt-key add - && \
    sudo apt-get update && \
    sudo apt-get -y install r-base

# install required R packages
RUN apt-get -y install libcurl4-gnutls-dev libssl-dev && \
    echo "options(repos = c(CRAN = 'https://cran.rstudio.com'))" > /root/.Rprofile && \
    R -e 'source("http://bioconductor.org/biocLite.R") ; biocLite(c("graph","RBGL","Rgraphviz"), ask=FALSE) ' && \
    R -e 'install.packages(c("methods", "data.table", "distr", "devtools", "knitr", "ggplot2", "glmnet", "pROC", "caret", "sqldf", "wordcloud"), repo="http://cran.us.r-project.org")' && \
    R -e "install.packages(c('devtools','mplot', 'googleVis'), repos = 'http://cran.us.r-project.org'); require(devtools); install_github('ramnathv/rCharts')"

# zeppelin install
ENV ZEPPELIN_VER=0.6.1
ENV ZEPPELIN_FULL_VER=$ZEPPELIN_VER-bin-netinst

RUN cd /opt && \
    wget http://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VER}/zeppelin-${ZEPPELIN_FULL_VER}.tgz && \
    tar -zxvf zeppelin-${ZEPPELIN_FULL_VER}.tgz && \
    ln -s zeppelin-${ZEPPELIN_FULL_VER} zeppelin && \
    rm /opt/zeppelin-${ZEPPELIN_FULL_VER}.tgz

RUN cd /opt/zeppelin && \
    ./bin/install-interpreter.sh --name md,shell,angular,python && \
    ./bin/install-interpreter.sh --name spark --artifact com.databricks:spark-csv_2.11:1.4.0

#ADD zeppelin-env.sh /opt/zeppelin/conf/zeppelin-env.sh
ADD docker-zeppelin.sh /opt/zeppelin/bin/docker-zeppelin.sh
ADD zeppelin-site.xml /opt/zeppelin/conf/zeppelin-site.xml
ADD interpreter.json /opt/zeppelin/conf/interpreter.json
# fix issue, when matplotlib can not find $DISPLAY
ADD matplotlibrc /etc/matplotlibrc

# download and install  spark from binary
ENV SPARK_VERSION=2.0.0-bin-hadoop2.6 \
    SPARK_HOME=/opt/spark \
    PATH=$PATH:$SPARK_HOME/bin
WORKDIR /opt
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}.tgz && \
    tar -zxvf spark-${SPARK_VERSION}.tgz && \
    ln -s spark-${SPARK_VERSION} spark && \
    rm spark-${SPARK_VERSION}.tgz

# credentials
#RUN mkdir /root/.aws
#ADD credentials /root/.aws/credentials

#ENV ZEPPELIN_NOTEBOOK_S3_USER= \
#    ZEPPELIN_NOTEBOOK_S3_BUCKET= \
#    AWS_KEY_ID= \
#    AWS_SECRET_KEY=

EXPOSE 8080 4040

VOLUME ["/workspace"]
WORKDIR /opt/zeppelin
ENTRYPOINT ["/opt/zeppelin/bin/docker-zeppelin.sh"]
#CMD ["bin/zeppelin.sh"]
