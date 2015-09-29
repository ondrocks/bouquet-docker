FROM squidsolutions/bouquet-bin

ADD mongodb.conf /etc/mongodb.conf
ADD apache.conf /etc/apache2/sites-available/000-default.conf
ADD tomcat-wrapper.sh /etc/tomcat-wrapper.sh
ADD cache.json /opt/squid/bouquet/etc/cache.json
ADD bouquet.xml /opt/squid/bouquet/etc/bouquet.xml
ADD explorer_webapp.xml /usr/share/tomcat7/explorer_webapp.xml
ADD supervisord.conf /etc/supervisord.conf

RUN a2enmod proxy_http rewrite headers cgi

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN chmod 755 /etc/tomcat-wrapper.sh

VOLUME /var/lib/mongodb

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]

RUN mkdir /var/www/html/fonts /var/www/html/js /var/www/html/css

ADD js/bootstrap.min.js /var/www/html/js/bootstrap.min.js
ADD js/jquery-1.11.3.min.js /var/www/html/js/jquery-1.11.3.min.js
ADD fonts/glyphicons-halflings-regular.woff2 /var/www/html/fonts/glyphicons-halflings-regular.woff2
ADD fonts/glyphicons-halflings-regular.ttf /var/www/html/fonts/glyphicons-halflings-regular.ttf
ADD fonts/glyphicons-halflings-regular.woff /var/www/html/fonts/glyphicons-halflings-regular.woff
ADD fonts/glyphicons-halflings-regular.eot /var/www/html/fonts/glyphicons-halflings-regular.eot
ADD fonts/glyphicons-halflings-regular.svg /var/www/html/fonts/glyphicons-halflings-regular.svg
ADD index.html /var/www/html/index.html
ADD logo.png /var/www/html/logo.png
ADD css/bootstrap.min.css /var/www/html/css/bootstrap.min.css
