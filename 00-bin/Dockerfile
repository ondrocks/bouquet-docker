FROM ubuntu:wily

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && apt-get install -y mongodb-server mongodb-clients redis-server redis-tools tomcat7 apache2 \
	supervisor wget && apt-get clean

RUN mkdir -p /opt/squid/bouquet/etc /opt/squid/bouquet/plugins && install -d /var/cache/bouquet -o tomcat7 -g tomcat7 \
        && ln -s  /var/cache/bouquet /var/lib/tomcat7/caches \
        && ln -s  /var/cache/bouquet /usr/share/tomcat7/caches \
	&& mkdir -p /var/lib/tomcat7/temp/poifiles && chmod 777 /var/lib/tomcat7/temp/poifiles
