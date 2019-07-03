FROM alpine:3.7
MAINTAINER Yves

ENV KAFKA_MGR_VERSION=1.3.3.17 \
SBT_VERSION=0.13.14

RUN apk upgrade --update && apk add --no-cache curl openjdk8 bash netcat-openbsd unzip
RUN curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt && \
    chmod 0755 /usr/local/bin/sbt
#
RUN mkdir -p /opt/kafka-manager-src && \
curl -LO https://github.com/yahoo/kafka-manager/archive/$KAFKA_MGR_VERSION.zip && \
mv $KAFKA_MGR_VERSION.zip  /opt/kafka-manager-src/

WORKDIR /opt/kafka-manager-src/
RUN unzip $KAFKA_MGR_VERSION.zip && rm -rf $KAFKA_MGR_VERSION.zip
WORKDIR /opt/kafka-manager-src/kafka-manager-$KAFKA_MGR_VERSION
RUN sbt clean dist && \
mv /opt/kafka-manager-src/kafka-manager-$KAFKA_MGR_VERSION/target/universal/kafka-manager-$KAFKA_MGR_VERSION.zip /opt && \
rm -rf /opt/kafka-manager-src
WORKDIR /opt
RUN unzip /opt/kafka-manager-$KAFKA_MGR_VERSION.zip && \
mv /opt/kafka-manager-$KAFKA_MGR_VERSION /opt/kafka-manager && \
chmod 755 -R /opt/kafka-manager && \
rm -rf /var/cache/apk/*
#
WORKDIR /opt/kafka-manager
ENTRYPOINT ["./bin/kafka-manager"]
