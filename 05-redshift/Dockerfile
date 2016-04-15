FROM squidsolutions/bouquet-war

ENV BOUQUET_VERSION=_BOUQUET_VERSION_

ADD http://openbouquet.io/download/plugins/bouquet-plugin-redshift-${BOUQUET_VERSION}-jar-with-dependencies.jar /opt/squid/bouquet/plugins/bouquet-plugin-redshift-${BOUQUET_VERSION}-jar-with-dependencies.jar

RUN chmod +r /opt/squid/bouquet/plugins/*.jar

