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
sudo docker build --rm=true -t "squidsolutions/bouquet" .
```

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
