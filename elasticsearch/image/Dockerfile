FROM robinlin/base-lite:java1.8
MAINTAINER robin robin890650@gmail.com

ENV elastic_ver 2.1.1

RUN useradd elastic
RUN wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${elastic_ver}/elasticsearch-${elastic_ver}.tar.gz && \
    tar -zxvf elasticsearch-${elastic_ver}.tar.gz && \
    mv elasticsearch-${elastic_ver} /usr/local/elasticsearch && \
    rm -f elasticsearch-${elastic_ver}.tar.gz && \
    chown elastic:elastic -R /usr/local/elasticsearch

RUN echo ""

# env config
ENV ELASTIC_HOME /usr/local/elasticsearch
ENV PATH $PATH:$ELASTIC_HOME/bin

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 9200
ENTRYPOINT ["/start.sh"]
