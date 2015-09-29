FROM squidsolutions/bouquet-conf

ADD com.squid.kraken.v4.war /var/lib/tomcat7/webapps/v4.2.war
ADD com.squid.kraken.v4.graphexplorer.war /var/lib/tomcat7/webapps/admin.war
ADD squid-v4-auth.war /var/lib/tomcat7/webapps/auth.war
RUN chmod +r /var/lib/tomcat7/webapps/*.war
