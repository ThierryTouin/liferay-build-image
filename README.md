# liferay-build-image

## Prise en compte dans l'image Liferay (partie statique)
- Mise à jour du drivers JDBC de la base de données
- Préinstallation d'un binaire OSGI 
- Préconfiguration de properties via un fichier `portal-ext.properties`
- Création de variable d'environnement 
  - Pour la base de données, Impact des fichiers 
    - `ROOT.xml`, 
    - `setenv.sh`, 
    - `portal-ext.properties`
  - Pour Elasticsearch Impact des fichiers 
    - `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config`, 
    - `setenv.sh`


## Prise en compte dans le container Liferay (partie variabilisée a valoriser en fonction de l'environnement)
- Externalisation du chemin de la GED via fichier `.config`
- Surcharge de la configuration par défaut du binaire OSGI
- Surcharge de properties via variable d'environnement fournie par Liferay 
- Création d'un fichier `.env` pour test

## TODO
- tester DIM
- S3 Store 
- Hikari
- Tester HTTPS



https://liferay-domain

172.21.0.5      liferay-domain-back


    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true">
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="/opt/liferay/ssl/keystore.jks" certificateKeyPassword="password"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>


    curl -kv https://lbi_liferay:8443