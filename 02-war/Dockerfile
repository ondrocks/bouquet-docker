FROM squidsolutions/bouquet-conf

ADD http://openbouquet.io/download/bouquet.war /var/lib/tomcat7/webapps/v4.2.war
ADD http://openbouquet.io/download/auth.war /var/lib/tomcat7/webapps/auth.war
ADD swagger /var/www/html/swagger
RUN chmod +r /var/lib/tomcat7/webapps/*.war
