FROM squidsolutions/bouquet-bin

ADD mongodb.conf /etc/mongodb.conf
ADD tomcat-wrapper.sh /etc/tomcat-wrapper.sh
ADD bouquet.json /opt/squid/bouquet/etc/bouquet.json
ADD auth-webapp.xml /opt/squid/bouquet/etc/auth-webapp.xml
ADD supervisord.conf /etc/supervisord.conf
ADD server.xml /opt/tomcat/conf/server.xml

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN chmod 755 /etc/tomcat-wrapper.sh

VOLUME /var/lib/mongodb

EXPOSE 80
CMD ["/usr/bin/supervisord", "-k", "-c", "/etc/supervisord.conf"]

RUN mkdir -p /opt/tomcat/webapps/ROOT/fonts /opt/tomcat/webapps/ROOT/js /opt/tomcat/webapps/ROOT/css /opt/tomcat/webapps/ROOT/Components-List_fichiers

ADD landing-page/js/bootstrap.min.js /opt/tomcat/webapps/ROOT/js/bootstrap.min.js
ADD landing-page/js/jquery-1.11.3.min.js /opt/tomcat/webapps/ROOT/js/jquery-1.11.3.min.js
ADD landing-page/fonts/glyphicons-halflings-regular.woff2 /opt/tomcat/webapps/ROOT/fonts/glyphicons-halflings-regular.woff2
ADD landing-page/fonts/glyphicons-halflings-regular.ttf /opt/tomcat/webapps/ROOT/fonts/glyphicons-halflings-regular.ttf
ADD landing-page/fonts/glyphicons-halflings-regular.woff /opt/tomcat/webapps/ROOT/fonts/glyphicons-halflings-regular.woff
ADD landing-page/fonts/glyphicons-halflings-regular.eot /opt/tomcat/webapps/ROOT/fonts/glyphicons-halflings-regular.eot
ADD landing-page/fonts/glyphicons-halflings-regular.svg /opt/tomcat/webapps/ROOT/fonts/glyphicons-halflings-regular.svg
ADD landing-page/index.html /opt/tomcat/webapps/ROOT/index.html
ADD landing-page/logo.png /opt/tomcat/webapps/ROOT/logo.png
ADD landing-page/css/bootstrap.min.css /opt/tomcat/webapps/ROOT/css/bootstrap.min.css
ADD landing-page/Components-List.html /opt/tomcat/webapps/ROOT/Components-List.html
ADD landing-page/Components-List_fichiers/filelist.xml /opt/tomcat/webapps/ROOT/Components-List_fichiers/filelist.xml
ADD landing-page/Components-List_fichiers/themedata.xml /opt/tomcat/webapps/ROOT/Components-List_fichiers/themedata.xml
