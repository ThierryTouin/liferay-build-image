#!/bin/bash
echo " Stoping Liferay server liferay_custom"
docker-compose -f ./liferay-compose.yml stop liferay_custom
docker-compose logs --follow liferay_custom
