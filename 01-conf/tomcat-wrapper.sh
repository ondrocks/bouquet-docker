#!/bin/bash
# Source: https://confluence.atlassian.com/plugins/viewsource/viewpagesrc.action?pageId=252348917

TOMCAT7_USER=tomcat7
TOMCAT7_GROUP=tomcat7
JAVA_OPTS="-Djava.awt.headless=true -Xmx512m -XX:+UseConcMarkSweepGC"
export JAVA_OPTS="${JAVA_OPTS} -Des.path.data=/var/lib/tomcat7/caches -Des.network.bind_host=127.0.0.1 -DDEBUG.MONGO=true -DDB.TRACE=true -Dlogback.configurationFile=logback.xml -Duser.timezone=UTC -Dkraken.cache.config.json=/opt/squid/bouquet/etc/cache.json -Dkraken.facet=front,keyserver,queries,queryworker -Dkraken.config.file=/opt/squid/bouquet/etc/bouquet.xml -Dkraken.ehcache.config=../../../var/lib/tomcat7/webapps/v4.2/conf/kraken_v4_ehcache.xml"
JAVA_HOME=/usr/lib/jvm/default-java
NAME=tomcat7
export CATALINA_HOME=/usr/share/$NAME
export CATALINA_BASE=/var/lib/$NAME
export CATALINA_PID="/var/run/$NAME.pid"
export CATALINA_SH="$CATALINA_HOME/bin/catalina.sh"

function shutdown()
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

