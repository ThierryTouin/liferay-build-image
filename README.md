# liferay-build-image

## Prise en compte dans l'image Liferay
- Mise à jour du drivers de base de données
- Création de variable d'environnement pour la base de données (ROOT.xml, setenv.sh, portal-ext.properties)
- Préinstallation d'un binaire OSGI
- Préconfiguration de properties via un fichier portal-ext.properties


## Prise en compte dans le container Liferay
- Externalisation du chemin de la GED via fichier .config
- Surcharge de la configuration par défaut du binaire OSGI
- Surcharge de properties via variable d'environnement fournie par Liferay 


## TODO
- tester DIM

