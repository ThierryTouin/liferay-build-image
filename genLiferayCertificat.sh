## Delete old keystore
rm -f ./resources-container/liferay/files/ssl/keystore.jks

## Generate jks
keytool -genkey -keyalg RSA -alias selfsigned -keystore ./resources-container/liferay/files/ssl/keystore.jks -storepass password -validity 360 -keysize 2048 -dname ${DNAME:-CN=lbi_liferay,OU=lbi_liferay,C=lbi_liferay} -storetype PKCS12

## Extract certificate and secret key
openssl pkcs12 -in ./resources-container/liferay/files/ssl/keystore.jks -passin pass:password -nodes -out ./resources-container/liferay/files/ssl/temporary.pem 
sed -n '/^-----BEGIN PRIVATE KEY-----/,/^-----END PRIVATE KEY-----/p'  ./resources-container/liferay/files/ssl/temporary.pem  > ./resources-container/liferay/files/ssl/private.key
sed -n '/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/p'  ./resources-container/liferay/files/ssl/temporary.pem  > ./resources-container/liferay/files/ssl/certificate.pem
rm -f  ./resources-container/liferay/files/ssl/temporary.pem 
rm -f ./resources-container/liferay/files/ssl/keystore.jks



#openssl req -x509 -newkey rsa:2048 -keyout ./resources-container/liferay/files/ssl/private.key -out ./resources-container/liferay/files/ssl/certificate.pem -days 365