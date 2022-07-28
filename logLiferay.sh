
#!/bin/bash
echo " Log Liferay server   lbi_liferay"
docker container logs -f --tail="500" lbi_liferay 2>&1 | ccze -m ansi
