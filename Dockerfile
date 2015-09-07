FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive 
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -y mongodb redis-server redis-tools tomcat7 apache2-mpm-worker \
	locales supervisor

RUN a2enmod proxy_http rewrite

RUN mkdir -p /opt/squid/kraken/etc && install -d /var/cache/kraken -o tomcat7 -g tomcat7 \
	&& ln -s  /var/cache/kraken /var/lib/tomcat7/caches \
	&& ln -s  /var/cache/kraken /usr/share/tomcat7/caches

ADD 01-conf/apache.conf /etc/apache2/sites-available/000-default.conf
ADD 01-conf/tomcat-wrapper.sh /etc/tomcat-wrapper.sh
ADD 01-conf/cache.json /opt/squid/kraken/etc/cache.json
ADD 01-conf/kraken.xml /opt/squid/kraken/etc/kraken.xml
ADD 01-conf/explorer_webapp.xml /usr/share/tomcat7/explorer_webapp.xml
ADD 01-conf/supervisord.conf /etc/supervisord.conf

RUN chmod 755 /etc/tomcat-wrapper.sh

ADD 02-war/v4.2.war /var/lib/tomcat7/webapps/v4.2.war
ADD 02-war/admin.war /var/lib/tomcat7/webapps/admin.war
ADD 02-war/auth.war /var/lib/tomcat7/webapps/auth.war

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]

