FROM squidsolutions/bouquet-bin

ARG INDEX_FILE=index-explorer.html

COPY mongodb.conf /etc/mongodb.conf
COPY apache.conf /etc/apache2/sites-available/000-default.conf
COPY tomcat-wrapper.sh /etc/tomcat-wrapper.sh
COPY bouquet.json /opt/squid/bouquet/etc/bouquet.json
COPY auth-webapp.xml /opt/squid/bouquet/etc/auth-webapp.xml
COPY supervisord.conf /etc/supervisord.conf

RUN a2enmod proxy_http rewrite headers cgi proxy_wstunnel

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN chmod 755 /etc/tomcat-wrapper.sh

VOLUME /var/lib/mongodb

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]

RUN mkdir /var/www/html/fonts /var/www/html/js /var/www/html/css /var/www/html/Components-List_fichiers

COPY landing-page/js/bootstrap.min.js /var/www/html/js/bootstrap.min.js
COPY landing-page/js/jquery-1.11.3.min.js /var/www/html/js/jquery-1.11.3.min.js
COPY landing-page/fonts/glyphicons-halflings-regular.woff2 /var/www/html/fonts/glyphicons-halflings-regular.woff2
COPY landing-page/fonts/glyphicons-halflings-regular.ttf /var/www/html/fonts/glyphicons-halflings-regular.ttf
COPY landing-page/fonts/glyphicons-halflings-regular.woff /var/www/html/fonts/glyphicons-halflings-regular.woff
COPY landing-page/fonts/glyphicons-halflings-regular.eot /var/www/html/fonts/glyphicons-halflings-regular.eot
COPY landing-page/fonts/glyphicons-halflings-regular.svg /var/www/html/fonts/glyphicons-halflings-regular.svg
COPY landing-page/${INDEX_FILE} /var/www/html/index.html
COPY landing-page/logo.png /var/www/html/logo.png
COPY landing-page/css/bootstrap.min.css /var/www/html/css/bootstrap.min.css
COPY landing-page/Components-List.html /var/www/html/Components-List.html
COPY landing-page/Components-List_fichiers/filelist.xml /var/www/html/Components-List_fichiers/filelist.xml
COPY landing-page/Components-List_fichiers/themedata.xml /var/www/html/Components-List_fichiers/themedata.xml
