mkdir temp
## Delete old keystore
rm -f ./temp/keystore.jks

## Generate jks
keytool -genkey -keyalg RSA -alias selfsigned -keystore ./temp/keystore.jks -storepass password -validity 360 -keysize 2048 -dname ${DNAME:-CN=liferay-domain,OU=liferay-domain,C=liferay-domain} -storetype PKCS12

## Extract certificate and secret key
openssl pkcs12 -in ./temp/keystore.jks -passin pass:password -nodes -out ./temp/temporary.pem 
sed -n '/^-----BEGIN PRIVATE KEY-----/,/^-----END PRIVATE KEY-----/p'  ./temp/temporary.pem  > ./resources-images/httpd/conf/ssl/private.key
sed -n '/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/p'  ./temp/temporary.pem  > ./resources-images/httpd/conf/ssl/certificate.pem
rm -f  ./temp/temporary.pem 