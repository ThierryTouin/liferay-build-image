#!/bin/sh

STR1='<SSLHostConfig>'
STR2='<UpgradeProtocol className=\"org.apache.coyote.http2.Http2Protocol\" \/>\n<SSLHostConfig>'

#sed -i 's/'"$STR1"'/'"$STR2"'/g' /opt/liferay/tomcat/conf/server.xml

## Only first occurence
sed -i '0,/'"$STR1"'/s/'"$STR1"'/'"$STR2"'/g' /opt/liferay/tomcat/conf/server.xml


cat /opt/liferay/tomcat/conf/server.xml





