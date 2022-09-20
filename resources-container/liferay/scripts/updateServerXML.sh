## Delete old keystore
## Delete old keystore
rm -f /opt/liferay/ssl/cacerts.jks


keytool -import -trustcacerts -keystore /opt/liferay/ssl/cacerts.jks \
   -storepass password -noprompt -alias server-alias -file /opt/liferay/ssl/certificate.pem

cp /opt/liferay/tomcat/conf/server.xml /opt/liferay/tomcat/conf/server.xml_bk

sed -i '86d;94d' /opt/liferay/tomcat/conf/server.xml

STR1='certificateKeystoreFile\=\"conf\/localhost-rsa.jks\"'
STR2='certificateKeystoreFile=\"\/opt\/liferay\/ssl\/cacerts.jks\" certificateKeystorePassword=\"password\" certificateKeyAlias=\"server-alias\" certificateKeystoreType=\"PKCS12\"'
sed -i 's/'"$STR1"'/'"$STR2"'/g' /opt/liferay/tomcat/conf/server.xml


#STR3='type=\"RSA\"'
#sed -i 's/'"$STR3"'/'" "'/g' /opt/liferay/tomcat/conf/server.xml

cat /opt/liferay/tomcat/conf/server.xml





