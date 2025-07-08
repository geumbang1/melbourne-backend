FROM php:8.1-apache

# 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

# public 디렉토리를 아파치 루트로 설정
COPY public/ /var/www/html/
COPY --chown=www-data:www-data public/ /var/www/html/

# 아파치 DocumentRoot 설정 보완 (필요 시)
# RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' /etc/apache2/sites-available/000-default.conf

EXPOSE 80
