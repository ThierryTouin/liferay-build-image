
#!/bin/bash
echo " Starting Liferay server   lbi_liferay"
docker-compose -f ./liferay-compose.yml up
docker-compose logs --follow lbi_liferay