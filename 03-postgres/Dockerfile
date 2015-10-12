FROM squidsolutions/bouquet-war


ADD http://openbouquet.io/download/plugins/v4-db-plugin-postgresql-1.0.0-RELEASE-jar-with-dependencies.jar /opt/squid/bouquet/plugins/v4-db-plugin-postgresql-1.0.0-RELEASE-jar-with-dependencies.jar
ADD http://openbouquet.io/download/plugins/v4-db-plugin-mysql-1.0.0-RELEASE-jar-with-dependencies.jar /opt/squid/bouquet/plugins/v4-db-plugin-mysql-1.0.0-RELEASE-jar-with-dependencies.jar

RUN chmod +r /opt/squid/bouquet/plugins/*.jar

