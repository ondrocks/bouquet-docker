FROM squidsolutions/bouquet-war

ENV BOUQUET_VERSION=4.2.17

ADD http://openbouquet.io/download/plugins/bouquet-plugin-postgresql-${BOUQUET_VERSION}-jar-with-dependencies.jar /opt/squid/bouquet/plugins/bouquet-plugin-postgresql-${BOUQUET_VERSION}-jar-with-dependencies.jar
ADD http://openbouquet.io/download/plugins/bouquet-plugin-mysql-${BOUQUET_VERSION}-jar-with-dependencies.jar /opt/squid/bouquet/plugins/bouquet-plugin-mysql-${BOUQUET_VERSION}-jar-with-dependencies.jar

RUN chmod +r /opt/squid/bouquet/plugins/*.jar

