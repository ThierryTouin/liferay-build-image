cp /opt/liferay/tomcat/conf/server.xml /opt/liferay/tomcat/conf/server.xml_bk

sed -i '101d;112d' /opt/liferay/tomcat/conf/server.xml

STR1='certificateKeyFile=\"conf\/localhost-rsa-key.pem\"'
STR2='certificateKeyFile=\"\/opt\/liferay\/ssl\/private.key\"'
sed -i 's/'"$STR1"'/'"$STR2"'/g' /opt/liferay/tomcat/conf/server.xml

STR3='certificateFile=\"conf\/localhost-rsa-cert.pem\"'
STR4='certificateFile=\"\/opt\/liferay\/ssl\/certificate.pem\" certificateKeyPassword=\"password\"'
sed -i 's/'"$STR3"'/'"$STR4"'/g' /opt/liferay/tomcat/conf/server.xml

STR5='certificateChainFile=\"conf\/localhost-rsa-chain.pem\"'
sed -i 's/'"$STR5"'/'" "'/g' /opt/liferay/tomcat/conf/server.xml

cat /opt/liferay/tomcat/conf/server.xml



