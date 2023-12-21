#!/bin/bash
echo " Stoping Liferay server liferay_custom"
docker compose -f ./liferay-compose.yml stop lbi_liferay

