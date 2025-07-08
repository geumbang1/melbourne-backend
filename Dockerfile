FROM php:8.1-apache

# PHP 확장 설치 (필요 시)
RUN docker-php-ext-install mysqli

# DocumentRoot를 public으로 설정
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Apache 설정 파일 내부 DocumentRoot 경로 변경
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf \
    && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf \
    && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/conf-available/*.conf

# 현재 프로젝트 폴더 복사
COPY . /var/www/html

# 포트 설정
EXPOSE 80
