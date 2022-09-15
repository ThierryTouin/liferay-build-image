
#!/bin/bash
echo " Reset lbi_httpd container"
docker stop lbi_httpd
docker rm lbi_httpd
docker rmi liferay-build-image_lbi_httpd
