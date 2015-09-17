Squidsolution's Bouquet Docker creation
=======================================

This repository hosts the Dockerfile that automates the creation of the Bouquet docker image.
This image is intended to be hosted on the squidsolutions repository in hub.docker.com.


Procedure
---------

Download the lastest succcessful build of admin, auth and bouquet builds. Put them in `the 02-war/` dir.

```
$ ls 02-war/ -1
admin.war
auth.war
Dockerfile
v4.2.war
```

Change the kraken.plugin.dir in the config 01-conf/tomcat-wrapper.sh 
```
export JAVA_OPTS="${JAVA_OPTS} -Des.path.data=/var/lib/tomcat7/caches -Dkraken.plugin.dir=/WHEREEVER -Des.network.bind_host=127.0.0.1 -DDEBUG.MONGO=true -DDB.TRACE=true -Dlogback.configurationFile=logback.xml -Duser.timezone=UTC -Dkraken.cache.config.json=/opt/squid/bouquet/etc/cache.json -Dkraken.facet=front,keyserver,queries,queryworker -Dkraken.config.file=/opt/squid/bouquet/etc/bouquet.xml -Dkraken.ehcache.config=../../../var/lib/tomcat7/webapps/v4.2/conf/kraken_v4_ehcache.xml"
```

Create the image:
```
sudo docker build --rm=true -t "squidsolutions/bouquet" .
```

Now, Put the plugins that correspond to your databases inside this directory kraken.plugin.dir;
For example v4-db-plugin-postgresql-1.0.0-RELEASE-jar-with-dependencies.jar to get access to a postgreSQL database;
Spark requires two jar the v4-db-plugin-spark-1.0.0-RELEASE-jar-with-dependencies.jar and hive-jdbc-1.1.0+SquidSolutions-standalone.jar

Test it:

```
sudo docker run -p 80:80 -t squidsolutions/bouquet
# http://localhost/release/v4.2/rs/status ?
```

Tag it with the build #:

```
sudo docker images # Get the image ID
sudo docker tag IMAGEID squidsolutions/bouquet:build_29
```

Push it to Docker hub:

```
sudo docker login
# See https://phab.squidsolutions.com/K6
sudo docker push squidsolutions/bouquet:build_29
sudo docker push squidsolutions/bouquet:latest
```
