#!/bin/sh
# Source: https://confluence.atlassian.com/plugins/viewsource/viewpagesrc.action?pageId=252348917

TOMCAT7_USER=tomcat7
TOMCAT7_GROUP=tomcat7
JAVA_OPTS="-Djava.awt.headless=true -Xmx512m -XX:+UseConcMarkSweepGC"
export JAVA_OPTS="${JAVA_OPTS} -Dfeature.dynamic=true -Des.path.data=/opt/tomcat/caches -Des.network.bind_host=127.0.0.1 -DDEBUG.MONGO=true -DDB.TRACE=true -Dlogback.configurationFile=logback.xml -Duser.timezone=UTC -Dbouquet.config.file=/opt/squid/bouquet/etc/bouquet.json -Dkraken.facet=front,keyserver,queries,queryworker -Dkraken.ehcache.config=../../opt/tomcat/webapps/v4.2/conf/kraken_v4_ehcache.xml -Dkraken.plugin.dir=/opt/squid/bouquet/plugins -Dconfig.file=/opt/squid/bouquet/etc/auth-webapp.xml -Dfile.encoding=UTF8 -Dkraken.autocreate=true"
#JAVA_HOME=/usr/lib/jvm/default-java
NAME=tomcat
export CATALINA_HOME=/opt/${NAME}
export CATALINA_BASE=${CATALINA_BASE}
export CATALINA_PID="/var/run/$NAME.pid"
export CATALINA_SH="$CATALINA_HOME/bin/catalina.sh"

shutdown ()
{
    date
    echo "Shutting down Tomcat"
    unset CATALINA_PID # Necessary in some cases
    unset LD_LIBRARY_PATH # Necessary in some cases
    unset JAVA_OPTS # Necessary in some cases

   ${CATALINA_SH} stop
}

date
echo "Starting Tomcat"

${CATALINA_SH} run

