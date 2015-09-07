FROM squid/kraken-bin


ADD postfix.conf /etc/postfix/main.cf
ADD apache.conf /etc/apache2/sites-available/000-default.conf
ADD tomcat-wrapper.sh /etc/tomcat-wrapper.sh
ADD cache.json /opt/squid/bouquet/etc/cache.json
ADD docker.xml /opt/squid/bouquet/etc/docker.xml
ADD explorer_webapp.xml /usr/share/tomcat7/explorer_webapp.xml
ADD supervisord.conf /etc/supervisord.conf

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN chmod 755 /etc/tomcat-wrapper.sh

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]
