FROM squidsolutions/bouquet-conf

ADD com.squid.kraken.v4.war /var/lib/tomcat7/webapps/v4.2.war
ADD com.squid.kraken.v4.graphexplorer.war /var/lib/tomcat7/webapps/admin.war
ADD squid-v4-auth.war /var/lib/tomcat7/webapps/auth.war
ADD v4-db-plugin-greenplum-1.0.0-RELEASE-jar-with-dependencies.jar /opt/squid/bouquet/plugins/v4-db-plugin-greenplum-1.0.0-RELEASE-jar-with-dependencies.jar
ADD v4-db-plugin-postgresql-1.0.0-RELEASE-jar-with-dependencies.jar /opt/squid/bouquet/plugins/v4-db-plugin-postgresql-1.0.0-RELEASE-jar-with-dependencies.jar
ADD v4-db-plugin-redshift-1.0.0-RELEASE-jar-with-dependencies.jar /opt/squid/bouquet/plugins/v4-db-plugin-redshift-1.0.0-RELEASE-jar-with-dependencies.jar

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]
