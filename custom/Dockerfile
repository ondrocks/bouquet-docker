FROM squidsolutions/bouquet-conf

ARG INDEX_FILE=index-explorer.html
ARG BOUQUET_VERSION=_BOUQUET_VERSION_

# Override the landing page
COPY landing-page/${INDEX_FILE} /var/www/html/index.html

# setup Bouquet Server
RUN wget http://openbouquet.io/download/${BOUQUET_VERSION}/bouquet.war -nv -O /var/lib/tomcat7/webapps/v4.2.war
RUN wget http://openbouquet.io/download/auth.war -nv -O /var/lib/tomcat7/webapps/auth.war
RUN chmod +r /var/lib/tomcat7/webapps/*.war
COPY swagger /var/www/html/swagger

# Add the plugins
RUN wget http://openbouquet.io/download/plugins/${BOUQUET_VERSION}/bouquet-plugin-postgresql-${BOUQUET_VERSION}-jar-with-dependencies.jar -nv -O /opt/squid/bouquet/plugins/bouquet-plugin-postgresql-${BOUQUET_VERSION}-jar-with-dependencies.jar
RUN wget http://openbouquet.io/download/plugins/bouquet-plugin-redshift-${BOUQUET_VERSION}-jar-with-dependencies.jar -nv -O /opt/squid/bouquet/plugins/bouquet-plugin-redshift-${BOUQUET_VERSION}-jar-with-dependencies.jar
RUN wget http://openbouquet.io/download/plugins/bouquet-plugin-greenplum-${BOUQUET_VERSION}-jar-with-dependencies.jar -nv -O /opt/squid/bouquet/plugins/bouquet-plugin-greenplum-${BOUQUET_VERSION}-jar-with-dependencies.jar
RUN chmod +r /opt/squid/bouquet/plugins/*.jar



