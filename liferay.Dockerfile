FROM liferay/dxp:7.4.13-u30

COPY --chown=liferay:liferay resources-images/liferay/portal-ext.properties /opt/liferay
COPY --chown=liferay:liferay resources-images/liferay/tomcat/bin/setenv.sh /opt/liferay/tomcat/bin
COPY --chown=liferay:liferay resources-images/liferay/tomcat/conf/Catalina/localhost/ROOT.xml /opt/liferay/tomcat/conf/Catalina/localhost
COPY --chown=liferay:liferay resources-images/liferay/tomcat/lib/postgresql.jar /opt/liferay/tomcat/lib
COPY --chown=liferay:liferay resources-images/liferay/osgi/configs/com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config /opt/liferay/osgi/configs

## Copy all binaries files from directory resources-image/binaries 
#COPY --chown=liferay:liferay resources-images/liferay/binaries/ /opt/liferay/osgi/modules
COPY --chown=liferay:liferay resources-images/liferay/binaries/module-**/target/*.jar /opt/liferay/osgi/modules/
COPY --chown=liferay:liferay resources-images/liferay/binaries/module-**/target/*.war /opt/liferay/osgi/war/

