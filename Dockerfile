FROM httpd:2.4
COPY ./web-resume/ /usr/local/apache2/htdocs/
EXPOSE 8080

