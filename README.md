Squidsolution's Bouquet Docker creation
=======================================

This repository hosts the Dockerfile that automates the creation of the Bouquet docker image.
This image is intended to be hosted on the squidsolutions repository in hub.docker.com.


Procedure
---------

Download the lastest succcessful build of admin, auth and bouquet builds. Put them in `the 02-war/` dir.
Put the plugins in the same directory:

```
$ ls -1 02-war/
com.squid.kraken.v4.graphexplorer.war
com.squid.kraken.v4.war
Dockerfile
squid-v4-auth.war
$ ls -1 03-postgres/
Dockerfile
v4-db-plugin-mysql-1.0.0-RELEASE-jar-with-dependencies.jar
v4-db-plugin-postgresql-1.0.0-RELEASE-jar-with-dependencies.jar
$ ls -1 04-hadoop/
Dockerfile
v4-db-plugin-apachedrill-1.0.0-RELEASE-jar-with-dependencies.jar
v4-db-plugin-spark-1.0.0-RELEASE-jar-with-dependencies.jar
$ ls -1 05-redshift/
Dockerfile
v4-db-plugin-redshift-1.0.0-RELEASE-jar-with-dependencies.jar
$ ls -1 06-greenplum/
Dockerfile
v4-db-plugin-greenplum-1.0.0-RELEASE-jar-with-dependencies.jar
```

Create the image:
```
sudo docker build --rm=true -t "squidsolutions/bouquet-bin" 00-bin
sudo docker build --rm=true -t "squidsolutions/bouquet-conf" 01-conf
sudo docker build --rm=true -t "squidsolutions/bouquet-war" 02-war
sudo docker build --rm=true -t "squidsolutions/bouquet" 03-postgres
# At this point you can already run bouquet.
sudo docker build --rm=true -t "squidsolutions/bouquet:hadoop" 04-hadoop
sudo docker build --rm=true -t "squidsolutions/bouquet:redshift" 05-redshift
sudo docker build --rm=true -t "squidsolutions/bouquet:greenplum" 06-greenplum
```

Test it:

```
sudo docker run -p 80:80 -t squidsolutions/bouquet
# http://localhost/release/v4.2/rs/status ?
```

If you want to have persistent mongo metadata:

```
mkdir /var/tmp/mongo
sudo docker run -p 80:80 -v /var/tmp/mongo:/var/lib/mongodb -t squidsolutions/bouquet
```

Push it to Docker hub:

```
sudo docker login
# See https://phab.squidsolutions.com/K6
sudo docker push squidsolutions/bouquet:latest
sudo docker push squidsolutions/bouquet:hadoop
sudo docker push squidsolutions/bouquet:redshift
sudo docker push squidsolutions/bouquet:greenplum
```

If you want to delete images:

```
sudo docker rmi squidsolutions/bouquet squidsolutions/bouquet:greenplum squidsolutions/bouquet:redshift squidsolutions/bouquet:hadoop squidsolutions/bouquet-war
```
