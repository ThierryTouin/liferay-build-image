domain="apache-domain"
domain2="apache-domain2"

## Delete old keystore
rm -Rf ./temp
mkdir temp

## Generate jks
#keytool -genkey -keyalg RSA -alias selfsigned -keystore ./temp/keystore.jks -storepass password -validity 360 -keysize 2048 -dname ${DNAME:-CN=$domain} -storetype PKCS12

## Extract certificate and secret key
#openssl pkcs12 -in ./temp/keystore.jks -passin pass:password -nodes -out ./temp/temporary.pem 
#sed -n '/^-----BEGIN PRIVATE KEY-----/,/^-----END PRIVATE KEY-----/p'  ./temp/temporary.pem  > ./resources-images/httpd/conf/ssl/private.key
#sed -n '/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/p'  ./temp/temporary.pem  > ./resources-images/httpd/conf/ssl/certificate.pem
#rm -f  ./temp/temporary.pem 


openssl req -x509 -newkey rsa:4096 -keyout ./resources-images/httpd/conf/ssl/private.key -out ./resources-images/httpd/conf/ssl/certificate.pem -days 365 -nodes -subj /CN=$domain
openssl req -x509 -newkey rsa:4096 -keyout ./resources-images/httpd/conf/ssl/private2.key -out ./resources-images/httpd/conf/ssl/certificate2.pem -days 365 -nodes -subj /CN=$domain2
