CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
CATALINA_OPTS="${CATALINA_OPTS} ${LIFERAY_JVM_OPTS}"

# DATASOURCE
CATALINA_OPTS="$CATALINA_OPTS -DLCP_SECRET_DATABASE_NAME=$LCP_SECRET_DATABASE_NAME"
CATALINA_OPTS="$CATALINA_OPTS -DLCP_SECRET_DATABASE_USER=$LCP_SECRET_DATABASE_USER"
CATALINA_OPTS="$CATALINA_OPTS -DLCP_SECRET_DATABASE_PASSWORD=$LCP_SECRET_DATABASE_PASSWORD"
CATALINA_OPTS="$CATALINA_OPTS -DELASTIC_NETWORK_HOST_ADDRESSES=$ELASTIC_NETWORK_HOST_ADDRESSES"

