
#!/bin/bash
echo " Reset lbi_elasticsearch container"
docker stop lbi_elasticsearch
docker rm lbi_elasticsearch
docker volume rm liferay-build-image_elasticsearch-plugins
docker volume rm liferay-build-image_elasticsearch-data
