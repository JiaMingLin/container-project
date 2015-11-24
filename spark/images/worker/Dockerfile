FROM robinlin/spark-base:latest

ADD start.sh /
ADD log4j.properties /opt/spark/conf/log4j.properties
EXPOSE 8080
RUN chmod 755 /start.sh

CMD ["/start.sh"]
