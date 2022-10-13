#!/bin/bash

function scriptExec() {

    if [[ -f "$1" ]]; then
        echo "$1 exists."
        echo -e ">>>> Execute $1"
        source $1
    else 
        echo "$1 does not exist."    
    fi

}

echo -e "\n\n================================================================================================"
scriptExec /opt/liferay/internal-scripts/scripts-db/updateDBCredentials.sh
scriptExec /opt/liferay/internal-scripts/scripts-el/update-elastic-conf.sh
scriptExec /opt/liferay/internal-scripts/scripts-ssl/displayServerXML.sh
scriptExec /opt/liferay/internal-scripts/scripts-business/copyBusinessFiles.sh
cp /mnt/liferay/activation-key-dxpdevelopment-7.4-developeractivationkeys.xml /opt/liferay/deploy



