## Generate jks
#$JAVA_HOME/bin/keytool -genkey -keyalg RSA -alias selfsigned -keystore /opt/liferay/ssl/keystore.jks -storepass password -validity 360 -keysize 2048 -dname ${DNAME:-CN=liferay-domain-back,OU=liferay-domain-back,C=liferay-domain-back} -storetype PKCS12
$JAVA_HOME/bin/keytool -genkey -keyalg RSA -alias selfsigned -keystore /opt/liferay/ssl/keystore.jks -storepass password -validity 360 -keysize 2048 -dname ${DNAME:-CN=lbi_liferay,OU=lbi_liferay,C=lbi_liferay} -storetype PKCS12

