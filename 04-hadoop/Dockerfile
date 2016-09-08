FROM squidsolutions/bouquet-war

ARG BOUQUET_VERSION=_BOUQUET_VERSION_

ADD http://openbouquet.io/download/plugins/hive-jdbc-1.1.0+SquidSolutions-standalone.jar /opt/squid/bouquet/plugins/hive-jdbc-1.1.0+SquidSolutions-standalone.jar
ADD http://openbouquet.io/download/plugins/bouquet-plugin-apachedrill-${BOUQUET_VERSION}-jar-with-dependencies.jar /opt/squid/bouquet/plugins/bouquet-plugin-apachedrill-${BOUQUET_VERSION}-jar-with-dependencies.jar
ADD http://openbouquet.io/download/plugins/bouquet-plugin-spark-${BOUQUET_VERSION}-jar-with-dependencies.jar /opt/squid/bouquet/plugins/bouquet-plugin-spark-${BOUQUET_VERSION}-jar-with-dependencies.jar
RUN chmod +r /opt/squid/bouquet/plugins/*.jar
