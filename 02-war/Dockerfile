FROM squidsolutions/bouquet-conf

ADD v4.2.war /var/lib/tomcat7/webapps/v4.2.war
ADD admin.war /var/lib/tomcat7/webapps/admin.war
ADD auth.war /var/lib/tomcat7/webapps/auth.war
ADD v4-db-plugin-oracle-1.0.0-t_302-SNAPSHOT-jar-with-dependencies.jar /opt/squid/bouquet/plugins/v4-db-plugin-oracle-1.0.0-t_302-SNAPSHOT-jar-with-dependencies.jar
ADD v4-db-plugin-postgresql-1.0.0-t_302-SNAPSHOT-jar-with-dependencies.jar /opt/squid/bouquet/plugins/v4-db-plugin-postgresql-1.0.0-t_302-SNAPSHOT-jar-with-dependencies.jar

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]
