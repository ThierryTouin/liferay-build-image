
#!/bin/bash
echo " Reset lbi_liferay container"
docker stop lbi_liferay
docker rm lbi_liferay
docker volume rm liferay-build-image_liferay-data
docker volume rm liferay-build-image_liferay-osgi-configs
docker volume rm liferay-build-image_liferay-osgi-marketplace
docker volume rm liferay-build-image_liferay-osgi-modules
docker volume rm liferay-build-image_liferay-osgi-war