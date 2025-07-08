FROM php:8.1-apache

# 필요한 PHP 확장 설치 (옵션)
RUN docker-php-ext-install mysqli

# Apache DocumentRoot를 public으로 설정
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Apache 설정 파일에 DocumentRoot 변경 적용
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# public 폴더 아래 코드 복사
COPY . /var/www/html

# Apache 재시작 포트는 기본 80
EXPOSE 80
