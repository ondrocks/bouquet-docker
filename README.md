Squidsolution's Bouquet Docker creation
=======================================

This repository hosts the Dockerfile that automates the creation of the Bouquet docker image.
This image is intended to be hosted on the squidsolutions repository in hub.docker.com.


Procedure
---------

First, war and jar files files should be available at http://openbouquet.io/download.

Create the image:
```
sudo docker build --rm=true -t "squidsolutions/bouquet-bin" 00-bin && \
sudo docker build --rm=true -t "squidsolutions/bouquet-conf" 01-conf && \
sudo docker build --rm=true -t "squidsolutions/bouquet-war" 02-war && \
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
If you want to delete images:

```
sudo docker rmi squidsolutions/bouquet squidsolutions/bouquet:greenplum squidsolutions/bouquet:redshift squidsolutions/bouquet:hadoop squidsolutions/bouquet-war
```
