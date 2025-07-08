FROM php:8.1-apache

# 필요한 패키지 설치 및 PHP 확장 설치
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

# public 디렉토리를 Apache DocumentRoot로 설정
COPY public/ /var/www/html/
COPY --chown=www-data:www-data public/ /var/www/html/

# Apache DocumentRoot가 public으로 되어있지 않다면, 아래 줄도 필요할 수 있음
# RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' /etc/apache2/sites-available/000-default.conf

EXPOSE 80
