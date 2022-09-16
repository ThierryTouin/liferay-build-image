## Delete old keystore
rm -f ./resources-images/liferay/keystore.jks

## Generate jks
keytool -genkey -keyalg RSA -alias selfsigned -keystore ./resources-images/liferay/keystore.jks -storepass password -validity 360 -keysize 2048 -dname ${DNAME:-CN=liferay-domain,OU=liferay-domain,C=liferay-domain} -storetype PKCS12

## Extract certificate and secret key
openssl pkcs12 -in ./resources-images/liferay/keystore.jks -passin pass:password -nodes -out ./resources-images/httpd/conf/ssl/temporary.pem 
sed -n '/^-----BEGIN PRIVATE KEY-----/,/^-----END PRIVATE KEY-----/p' ./resources-images/httpd/conf/ssl/temporary.pem > ./resources-images/httpd/conf/ssl/private.key
sed -n '/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/p' ./resources-images/httpd/conf/ssl/temporary.pem > ./resources-images/httpd/conf/ssl/certificate.pem
rm -f ./resources-images/httpd/conf/ssl/temporary.pem  