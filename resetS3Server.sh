
#!/bin/bash
echo " Reset lbi_minio / lbi_minio_cli container"
docker stop lbi_minio
docker stop lbi_minio_cli
docker rm lbi_minio
docker rm lbi_minio_cli
docker volume rm liferay-build-image_minio-root
docker volume rm liferay-build-image_minio-export

