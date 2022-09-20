domain='lbi_liferay'
alias=tomcat
password='password'


rmdir -Rf ./resources-container/liferay/files/ssl
mkdir ./resources-container/liferay/files/ssl
openssl req -x509 -newkey rsa:4096 -keyout ./resources-container/liferay/files/ssl/private.key -out ./resources-container/liferay/files/ssl/certificate.pem -days 365 -nodes -subj /CN=$domain
openssl pkcs12 -export -in ./resources-container/liferay/files/ssl/certificate.pem -inkey ./resources-container/liferay/files/ssl/private.key -out ./resources-container/liferay/files/ssl/cacerts.jks -name $alias