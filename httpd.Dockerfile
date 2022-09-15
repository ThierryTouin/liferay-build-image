FROM httpd:2.4-alpine

COPY resources-images/httpd/ /usr/local/apache2/

ENTRYPOINT [ "httpd-foreground"]
