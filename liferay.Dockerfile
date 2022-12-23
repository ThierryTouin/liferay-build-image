FROM liferay/dxp:7.4.13-u30

#USER root
#RUN sed -i '6 i execute_scripts /opt/liferay/internalscripts' /usr/local/bin/configure_liferay.sh
#RUN chown liferay:liferay /usr/local/bin/configure_liferay.sh
#USER liferay

# Update server.xml for ssl connection
USER root

RUN sed -i '86d;94d' /opt/liferay/tomcat/conf/server.xml
ARG STR1='certificateKeystoreFile\=\"conf\/localhost-rsa.jks\"'
ARG STR2='certificateKeystoreFile=\"\/opt\/liferay\/ssl\/cacerts.jks\" certificateKeystorePassword=\"${CERTIFICATE_KEY_PASSWORD}\" certificateKeyAlias=\"tomcat\" certificateKeystoreType=\"PKCS12\"'
RUN sed -i 's/'"$STR1"'/'"$STR2"'/g' /opt/liferay/tomcat/conf/server.xml
RUN chown liferay:liferay /opt/liferay
USER liferay

# Install glowroot
RUN curl -L https://github.com/glowroot/glowroot/releases/download/v0.13.6/glowroot-0.13.6-dist.zip > glowroot-dist.zip \
  && unzip glowroot-dist.zip \
  && rm glowroot-dist.zip 

COPY --chown=liferay:liferay resources-images/liferay/glowroot/*.json /opt/liferay/glowroot/

# Update Liferay Patching tool & apply a factif hotfix
COPY --chown=liferay:liferay resources-images/liferay/patching-tool/patching-tool-3.0.37.zip /opt/liferay/
RUN \
  /opt/liferay/patching-tool/patching-tool.sh info \
  && mv /opt/liferay/patching-tool/ /opt/liferay/patching-tool_3-0-36 \
  && unzip /opt/liferay/patching-tool-3.0.37.zip \
  && rm /opt/liferay/patching-tool-3.0.37.zip \
  && /opt/liferay/patching-tool/patching-tool.sh info

COPY --chown=liferay:liferay resources-images/liferay/patching-tool/patches/liferay-hotfix-960-7413.zip /opt/liferay/patching-tool/patches

RUN \
  /opt/liferay/patching-tool/patching-tool.sh install \
  && /opt/liferay/patching-tool/patching-tool.sh info 


# Update Liferay configuration
COPY --chown=liferay:liferay resources-images/liferay/portal-ext.properties /opt/liferay
COPY --chown=liferay:liferay resources-images/liferay/tomcat/bin/setenv.sh /opt/liferay/tomcat/bin
COPY --chown=liferay:liferay resources-images/liferay/tomcat/conf/Catalina/localhost/ROOT.xml /opt/liferay/tomcat/conf/Catalina/localhost
COPY --chown=liferay:liferay resources-images/liferay/tomcat/lib/postgresql.jar /opt/liferay/tomcat/lib
COPY --chown=liferay:liferay resources-images/liferay/osgi/configs/com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config /opt/liferay/osgi/configs
COPY --chown=liferay:liferay resources-images/liferay/internal-scripts /opt/liferay/internal-scripts

# Copy all binaries files from directory resources-image/binaries 
COPY --chown=liferay:liferay resources-images/liferay/binaries/module-**/target/*.jar /opt/liferay/osgi/biz-modules/
#COPY --chown=liferay:liferay resources-images/liferay/binaries/module-**/target/*.war /opt/liferay/osgi/war/