#!/bin/sh

#
# T929
# We need to wait until Bouquet has correctly launched
#

[ -f /var/lib/mongodb/_created_customer ] && exit 0

while true;do

       if grep -q "Open Bouquet started with build version" /var/log/tomcat7/kraken.log > /dev/null 2>&1;then
               wget --post-data='' http://127.0.0.1:8080/v4.2/admin/create-customer && touch /var/lib/mongodb/_created_customer                
               exit 0
       fi
       sleep 2

done

