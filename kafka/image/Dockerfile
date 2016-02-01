FROM robinlin/base-lite:java1.8
MAINTAINER robin robin890650@gmail.com

ENV kafka_ver 0.8.2.2
ENV scala_ver 2.10

# download kafka tar ball
RUN cd /usr/local && \
    wget http://www.us.apache.org/dist/kafka/${kafka_ver}/kafka_${scala_ver}-${kafka_ver}.tgz && \
    tar -zxvf kafka_${scala_ver}-${kafka_ver}.tgz && \
    mv kafka_${scala_ver}-${kafka_ver} kafka && \
    rm -f kafka_${scala_ver}-${kafka_ver}.tgz
# env config
ENV KAFKA_HOME /usr/local/kafka
ENV PATH ${PATH}:${KAFKA_HOME}/bin:${KAFKA_HOME}/bin

# expose port
EXPOSE 9092

ADD start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
