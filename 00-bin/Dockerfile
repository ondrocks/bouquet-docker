FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive 
RUN apt-get update && apt-get install -y mongodb redis-server redis-tools tomcat7 apache2-mpm-worker \
	locales supervisor \
	&& apt-get upgrade -y

RUN a2enmod proxy_http rewrite

RUN mkdir -p /opt/squid/bouquet/etc && install -d /var/cache/bouquet -o tomcat7 -g tomcat7 \
        && ln -s  /var/cache/bouquet /var/lib/tomcat7/caches \
        && ln -s  /var/cache/bouquet /usr/share/tomcat7/caches


