export LCP_SECRET_DATABASE_URL=jdbc:postgresql://lbi_postgresql:5432/lportal
mv /opt/liferay/tomcat/conf/Catalina/localhost/ROOT.xml /opt/liferay/tomcat/conf/Catalina/localhost/ROOT.xml_sav
sed 's/REPLACE_USER_BY_SED_CMD/dbuser/g' /opt/liferay/tomcat/conf/Catalina/localhost/ROOT.xml_sav > /opt/liferay/tomcat/conf/Catalina/localhost/ROOT.xml_tmp
sed 's/REPLACE_PASSWORD_BY_SED_CMD/dbpassword/g' /opt/liferay/tomcat/conf/Catalina/localhost/ROOT.xml_tmp > /opt/liferay/tomcat/conf/Catalina/localhost/ROOT.xml