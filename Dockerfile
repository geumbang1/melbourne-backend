FROM php:8.1-apache

RUN a2enmod rewrite
RUN docker-php-ext-install mysqli

COPY ./public /var/www/html/

EXPOSE 80
