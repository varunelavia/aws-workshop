FROM php:8.0-apache
WORKDIR /var/www/html
COPY ../php-calc/index.php index.php
EXPOSE 80