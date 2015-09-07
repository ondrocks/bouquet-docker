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

Create the image:
```
docker build --rm=true -t "bouquet" .
```
