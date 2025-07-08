FROM php:8.2-apache

# public 폴더 안에 있는 내용을 웹 루트에 복사
COPY public/ /var/www/html/

# 기본 index 파일로 places.php 사용
RUN echo "DirectoryIndex places.php" > /etc/apache2/conf-available/directoryindex.conf && \
    a2enconf directoryindex
