FROM liferay/dxp:7.4.13-u30

COPY --chown=liferay:liferay resources-image/portal-ext.properties /opt/liferay
COPY --chown=liferay:liferay resources-image/binaries/auto-logging-1.0.0-SNAPSHOT.jar /opt/liferay/osgi/modules
COPY --chown=liferay:liferay resources-image/tomcat/bin/setenv.sh /opt/liferay/tomcat/bin
COPY --chown=liferay:liferay resources-image/tomcat/conf/Catalina/localhost/ROOT.xml /opt/liferay/tomcat/conf/Catalina/localhost
COPY --chown=liferay:liferay resources-image/tomcat/lib/postgresql.jar /opt/liferay/tomcat/lib
COPY --chown=liferay:liferay resources-image/osgi/configs/com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config /opt/liferay/osgi/configs


#### Lister les versions ! => creation de label