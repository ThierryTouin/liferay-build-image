
#!/bin/bash
echo " Starting Liferay server   lbi_liferay"
docker-compose --env-file .env_dev -f ./liferay-compose.yml up -d

