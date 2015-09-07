FROM squid/kraken-conf

ADD v4.2.war /var/lib/tomcat7/webapps/v4.2.war
ADD admin.war /var/lib/tomcat7/webapps/admin.war
ADD auth.war /var/lib/tomcat7/webapps/auth.war

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]
