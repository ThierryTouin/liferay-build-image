$JAVA_HOME/bin/keytool -genkey -keyalg RSA -alias selfsigned -keystore /opt/liferay/keystore.jks -storepass password -validity 360 -keysize 2048 -dname ${DNAME:-CN=liferay-domain,OU=liferay-domain,C=liferay-domain} -storetype PKCS12

