FROM alpine:3.4

# Supervisor
# Java

# Tomcat
# Mongo

# Redis

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    TOMCAT_MAJOR=7 \
    TOMCAT_VERSION=7.0.69 \
    TOMCAT_HOME=/opt/tomcat \
    CATALINA_HOME=/opt/tomcat \
    CATALINA_OUT=/dev/null

# openjdk8-jre-base
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk upgrade && apk add curl runit@testing openjdk8 ttf-liberation redis mongodb@testing && \
    curl -jksSL -o /tmp/apache-tomcat.tar.gz http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    gunzip /tmp/apache-tomcat.tar.gz && \
    mkdir /opt && \
    tar -C /opt -xf /tmp/apache-tomcat.tar && \
    ln -s /opt/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME} && \
    rm -rf ${TOMCAT_HOME}/webapps/* && \
    mkdir /opt/tomcat/caches && \
    mkdir /opt/tomcat/temp/poifiles && \
    mkdir -p /opt/squid/bouquet/etc && \
    mkdir -p /opt/squid/bouquet/plugins && \
    apk del --purge curl && \
    rm -f /usr/bin/mongoperf /usr/bin/mongos /usr/bin/mongosniff

CMD ["sh", "-c", "exec runsvdir -P /etc/service/"]
