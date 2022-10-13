#!/bin/bash
echo " Log S3 lbi_minio"
docker container logs -f --tail="500" lbi_minio 2>&1 | ccze -m ansi

