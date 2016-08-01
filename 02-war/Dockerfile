FROM squidsolutions/bouquet-conf
ARG BOUQUET_VERSION=_BOUQUET_VERSION_

# ADD http://openbouquet.io/download/${BOUQUET_VERSION}/bouquet.war /var/lib/tomcat7/webapps/v4.2.war
RUN wget http://openbouquet.io/download/${BOUQUET_VERSION}/bouquet.war -nv -O /var/lib/tomcat7/webapps/v4.2.war

# ADD http://openbouquet.io/download/auth.war /var/lib/tomcat7/webapps/auth.war
RUN wget http://openbouquet.io/download/auth.war -nv -O /var/lib/tomcat7/webapps/auth.war

ADD swagger /var/www/html/swagger
RUN chmod +r /var/lib/tomcat7/webapps/*.war
