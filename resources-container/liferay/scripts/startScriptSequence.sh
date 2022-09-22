#!/bin/sh
echo -e "\n\n================================ Start /opt/liferay/internal-scripts/scripts-db/updateDBCredentials.sh ================================"
source /opt/liferay/internal-scripts/scripts-db/updateDBCredentials.sh
echo -e "\n\n================================ Start /opt/liferay/internal-scripts/scripts-el/update-elastic-conf.sh ================================"
source /opt/liferay/internal-scripts/scripts-el/update-elastic-conf.sh
echo -e "\n\n================================ Start /opt/liferay/internal-scripts/scripts-ssl/displayServerXML.sh ================================"
source /opt/liferay/internal-scripts/scripts-ssl/displayServerXML.sh
