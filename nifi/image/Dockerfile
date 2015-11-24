FROM robinlin/base

MAINTAINER robinlin <robin890650@gmail.com>

# NiFi
ENV NIFI_HOME         /opt/nifi

RUN git clone https://github.com/JiaMingLin/nifi.git $NIFI_HOME


WORKDIR $NIFI_HOME
RUN git pull
RUN mvn clean install -DskipTests

RUN mkdir ~/nifi-deploy

RUN tar xzf $NIFI_HOME/nifi-assembly/target/nifi-*-bin.tar.gz -C ~/nifi-deploy && \
    mv ~/nifi-deploy/nifi-* ~/nifi-deploy/nifi

EXPOSE 8080

ADD run.sh /run.sh
RUN chmod 755 /run.sh

CMD "/run.sh"
