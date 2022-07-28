
#!/bin/bash
echo " Reset  lbi_postgresql container"
docker stop lbi_postgresql
docker rm lbi_postgresql
docker volume rm liferay-build-image_database_data