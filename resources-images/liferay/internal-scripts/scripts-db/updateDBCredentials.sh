export LCP_SECRET_DATABASE_URL=jdbc:postgresql://lbi_postgresql:5432/lportal
sed -i 's/REPLACE_USER_BY_SED_CMD/dbuser/g' /opt/liferay/tomcat/conf/Catalina/localhost/ROOT.xml
sed -i 's/REPLACE_PASSWORD_BY_SED_CMD/dbpassword/g' /opt/liferay/tomcat/conf/Catalina/localhost/ROOT.xml
