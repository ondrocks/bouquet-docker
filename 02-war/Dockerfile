FROM squidsolutions/bouquet-conf
ARG BOUQUET_VERSION=_BOUQUET_VERSION_

# ADD http://openbouquet.io/download/${BOUQUET_VERSION}/bouquet.war /opt/tomcat/webapps/v4.2.war
RUN wget http://openbouquet.io.s3-website-us-east-1.amazonaws.com/download/obs/${BOUQUET_VERSION}/bouquet.war -O /opt/tomcat/webapps/release#v4.2.war

# ADD http://openbouquet.io/download/auth.war /opt/tomcat/webapps/auth.war
#RUN wget http://openbouquet.io/download/auth.war -O /opt/tomcat/webapps/release#auth.war

ADD swagger /opt/tomcat/webapps/ROOT/swagger
RUN chmod +r /opt/tomcat/webapps/*.war
