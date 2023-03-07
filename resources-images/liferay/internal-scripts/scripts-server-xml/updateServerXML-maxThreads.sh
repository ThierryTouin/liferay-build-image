#!/bin/sh

STR1='maxThreads=\"150\"'
STR2='maxThreads=\"350\"'

#sed -i 's/'"$STR1"'/'"$STR2"'/g' /opt/liferay/tomcat/conf/server.xml

## Only second occurence
sed -i 's/'"$STR1"'/'"$STR2"'/g' /opt/liferay/tomcat/conf/server.xml


#cat /opt/liferay/tomcat/conf/server.xml





