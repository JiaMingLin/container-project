FROM robinlin/hadoop

MAINTAINER robinlin robinlin@iii.org.tw

RUN yum install which -y
ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
