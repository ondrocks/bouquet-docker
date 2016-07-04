FROM squidsolutions/bouquet-bin

ADD mongodb.conf /etc/mongodb.conf
ADD apache.conf /etc/apache2/sites-available/000-default.conf
ADD tomcat-wrapper.sh /etc/tomcat-wrapper.sh
ADD bouquet.json /opt/squid/bouquet/etc/bouquet.json
ADD auth-webapp.xml /opt/squid/bouquet/etc/auth-webapp.xml
ADD supervisord.conf /etc/supervisord.conf
ADD create-customer.sh /tmp/create-customer.sh

RUN a2enmod proxy_http rewrite headers cgi proxy_wstunnel

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN chmod 755 /etc/tomcat-wrapper.sh

VOLUME /var/lib/mongodb

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]

RUN mkdir /var/www/html/fonts /var/www/html/js /var/www/html/css /var/www/html/Components-List_fichiers

ADD landing-page/js/bootstrap.min.js /var/www/html/js/bootstrap.min.js
ADD landing-page/js/jquery-1.11.3.min.js /var/www/html/js/jquery-1.11.3.min.js
ADD landing-page/fonts/glyphicons-halflings-regular.woff2 /var/www/html/fonts/glyphicons-halflings-regular.woff2
ADD landing-page/fonts/glyphicons-halflings-regular.ttf /var/www/html/fonts/glyphicons-halflings-regular.ttf
ADD landing-page/fonts/glyphicons-halflings-regular.woff /var/www/html/fonts/glyphicons-halflings-regular.woff
ADD landing-page/fonts/glyphicons-halflings-regular.eot /var/www/html/fonts/glyphicons-halflings-regular.eot
ADD landing-page/fonts/glyphicons-halflings-regular.svg /var/www/html/fonts/glyphicons-halflings-regular.svg
ADD landing-page/index.html /var/www/html/index.html
ADD landing-page/logo.png /var/www/html/logo.png
ADD landing-page/css/bootstrap.min.css /var/www/html/css/bootstrap.min.css
ADD landing-page/Components-List.html /var/www/html/Components-List.html
ADD landing-page/Components-List_fichiers/filelist.xml /var/www/html/Components-List_fichiers/filelist.xml
ADD landing-page/Components-List_fichiers/themedata.xml /var/www/html/Components-List_fichiers/themedata.xml
