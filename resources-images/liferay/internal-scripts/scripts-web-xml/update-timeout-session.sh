#!/bin/sh 
echo "#######################################################"
echo " Update Timeout Session"

STR1='<session-timeout>15<\/session-timeout>'
STR2='<session-timeout>30<\/session-timeout>'
sed -i 's/'"$STR1"'/'"$STR2"'/g' /opt/liferay/tomcat/webapps/ROOT/WEB-INF/web.xml

cat /opt/liferay/tomcat/webapps/ROOT/WEB-INF/web.xml