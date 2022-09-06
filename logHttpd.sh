
#!/bin/bash
echo " Log Httpd server   lbi_httpd"
docker container logs -f --tail="500" lbi_httpd 2>&1 | ccze -m ansi
