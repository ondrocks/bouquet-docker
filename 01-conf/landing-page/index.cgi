#!/bin/sh


echo "Status: 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

# Get the host's IP address
HOST_IP=`/sbin/ip route|awk '/default/ { print $3 }'`

sed "s/_HOST_IP_/${HOST_IP}/g" /var/www/html/index.html
