Bouquet Docker creation
=======================================

This repository hosts the Dockerfiles that automate the creation of the Bouquet docker image.
This image is intended to be hosted on the squidsolutions repository in hub.docker.com.


Procedure
---------

Create the image for Bouquet version X.X.X

```
docker build --rm=true -t "squidsolutions/bouquet-bin" 00-bin && \
docker build --rm=true -t "squidsolutions/bouquet-conf" 01-conf && \
docker build --rm=true --build-arg BOUQUET_VERSION=X.X.X -t "squidsolutions/bouquet-war" 02-war && \
docker build --rm=true --build-arg BOUQUET_VERSION=X.X.X -t "squidsolutions/bouquet" 03-postgres
# At this point you can already run bouquet.
# Following images are for extra plugins
docker build --rm=true --build-arg BOUQUET_VERSION=X.X.X -t "squidsolutions/bouquet:hadoop" 04-hadoop
docker build --rm=true --build-arg BOUQUET_VERSION=X.X.X -t "squidsolutions/bouquet:redshift" 05-redshift
docker build --rm=true --build-arg BOUQUET_VERSION=X.X.X -t "squidsolutions/bouquet:greenplum" 06-greenplum
```

Test it:

```
docker run -p 80:80 -t squidsolutions/bouquet
wget -O - -q http://localhost/release/v4.2/rs/status 
```

If you want to have persistent mongo metadata:

```
mkdir /var/tmp/mongo
docker run -p 80:80 -v /var/tmp/mongo:/var/lib/mongodb -t squidsolutions/bouquet
```
If you want to delete images:

```
docker rmi squidsolutions/bouquet squidsolutions/bouquet:greenplum squidsolutions/bouquet:redshift squidsolutions/bouquet:hadoop squidsolutions/bouquet-war
```

To create a custom image for Bouquet version X.X.X and using a given index file (eg. index-ob1-staging.html).

```
docker build --rm=true -t "squidsolutions/bouquet-bin" 00-bin && \
docker build --rm=true -t "squidsolutions/bouquet-conf" 01-conf && \
docker build --rm=true --build-arg BOUQUET_VERSION=X.X.X --build-arg INDEX_FILE=index-ob1-staging.html -t "squidsolutions/bouquet:staging" custom
```
Note : this version includes Postgres, Redshift and Greenplum jdbc drivers
