FROM liferay/dxp:7.4.13-u30

COPY --chown=liferay:liferay resources-images/liferay/portal-ext.properties /opt/liferay
COPY --chown=liferay:liferay resources-images/liferay/tomcat/bin/setenv.sh /opt/liferay/tomcat/bin
COPY --chown=liferay:liferay resources-images/liferay/tomcat/conf/Catalina/localhost/ROOT.xml /opt/liferay/tomcat/conf/Catalina/localhost
COPY --chown=liferay:liferay resources-images/liferay/tomcat/lib/postgresql.jar /opt/liferay/tomcat/lib
COPY --chown=liferay:liferay resources-images/liferay/osgi/configs/com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config /opt/liferay/osgi/configs

## Copy all binaries files from directory resources-image/binaries 
COPY --chown=liferay:liferay resources-images/liferay/binaries/ /opt/liferay/osgi/modules

#USER root
#RUN ["apt-get", "-y", "update"]
#RUN ["apt-get", "-y", "install", "libapr1"]
#RUN ["apt-get", "-y", "install", "libapr1-dev"]
#RUN ["apt-get", "-y", "upgrade", "libtcnative-1"]
#USER liferay