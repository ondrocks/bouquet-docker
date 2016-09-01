#!/bin/sh

#
#
# Author: G. Doumergue <gdoumergue@squidsolutions.com>
# Upgrades bouquet WAR along with its plugins
#
#

CATALINA_BASE=/opt/tomcat
PLUGINS_DIR=/opt/squid/bouquet/plugins


DOWNLOAD_FROM="http://openbouquet.io/download"

WEBAPPS_DIR=${CATALINA_BASE}/webapps

VERSION=`wget -O - -q ${DOWNLOAD_FROM}/version.txt`

echo "This script will install the latest (v.${VERSION}) bouquet API."
read -p "Proceed? Y/n: " ANSWER

if [ "${ANSWER}" != "y" ];then
        echo "Do nothing"
        exit 4
fi

# Let's go

sv down tomcat

rm -fr ${WEBAPPS_DIR}/v4.2*
rm -fr ${CATALINA_BASE}/work/*

echo "Downloading bouquet"
wget -q -O ${WEBAPPS_DIR}/v4.2.war ${DOWNLOAD_FROM}/${VERSION}/bouquet.war

# Plugins
for PLUGIN in `ls ${PLUGINS_DIR}/*.jar`;do
	NEW_PLUGIN=`echo ${PLUGIN} | sed "s/4\.2\.../${VERSION}/"`
	NEW_PLUGIN_FILE=`basename ${NEW_PLUGIN}`
	if [ ! "${NEW_PLUGIN}" = "${PLUGIN}" ];then
		echo "Downloading ${NEW_PLUGIN_FILE}"
		wget -q -O ${NEW_PLUGIN} ${DOWNLOAD_FROM}/plugins/${NEW_PLUGIN_FILE} && rm -f ${PLUGIN}
	fi

done

sv up tomcat
