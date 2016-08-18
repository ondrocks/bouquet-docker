#!/bin/sh

#
#
# Author: G. Doumergue <gdoumergue@squidsolutions.com>
# Upgrades bouquet WAR along with its plugins
#
#

TOMCAT_STOP="supervisorctl -u admin -p TOTO stop tomcat;pkill java"
TOMCAT_START="supervisorctl -u admin -p TOTO start tomcat"
CATALINA_BASE=/var/lib/tomcat7
PLUGINS_DIR=/opt/squid/bouquet/plugins

WEBAPPS_DIR=${CATALINA_BASE}/webapps

VERSION=`wget -O - -q http://openbouquet.io/download/version.txt`

echo "This script will install the latest (v.${VERSION}) bouquet API."
read -p "Proceed? Y/n: " ANSWER

if [ "${ANSWER}" != "y" ];then
        echo "Do nothing"
        exit 4
fi

# Let's go

${TOMCAT_STOP}

rm -fr ${WEBAPPS_DIR}/v4.2*
rm -fr ${CATALINA_BASE}/work/*

echo "Downloading bouquet"
wget -q -O ${WEBAPPS_DIR}/v4.2.war https://openbouquet.io/download/${VERSION}/bouquet.war

# Plugins
for PLUGIN in ${PLUGINS_DIR}/*.jar;do
	NEW_PLUGIN=`echo ${PLUGIN} | sed "s/4\.2\.../${VERSION}/"`
	NEW_PLUGIN_FILE=`basename ${NEW_PLUGIN}`
	rm -f ${PLUGIN}
	echo "Downloading ${NEW_PLUGIN_FILE}"
	wget -q -O ${NEW_PLUGIN} https://openbouquet.io/download/plugins/${NEW_PLUGIN_FILE}

done

${TOMCAT_START}
