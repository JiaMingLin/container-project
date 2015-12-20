FROM robinlin/hadoop

MAINTAINER robinlin robinlin@iii.org.tw
# formatting the HDFS Filesystem
RUN yum install which -y && \
    su hdfs && \
    hdfs namenode -format && \
    exit

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
