CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Duser.timezone=GMT -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
CATALINA_OPTS="${CATALINA_OPTS} ${LIFERAY_JVM_OPTS}"

# DATASOURCE
CATALINA_OPTS="$CATALINA_OPTS -DJAVA_ELASTIC_NETWORK_HOST_ADDRESSES=$ELASTIC_NETWORK_HOST_ADDRESSES"
CATALINA_OPTS="$CATALINA_OPTS -DJAVA_LCP_SECRET_DATABASE_URL=$LCP_SECRET_DATABASE_URL"

# SSL
#CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.ssl.trustStore=/opt/liferay/ssl/cacerts.jks -Djavax.net.ssl.trustStorePassword=password"