FROM httpd:2.4-alpine

MAINTAINER Wouter Vernaillen <wouter@triberay.com>

COPY resources-images/httpd/ /usr/local/apache2/

ENTRYPOINT [ "httpd-foreground"]
