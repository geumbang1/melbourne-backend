FROM php:8.2-apache

# public 폴더 안 파일들을 웹 루트로 복사
COPY public/ /var/www/html/

# index.php 대신 places.php를 기본으로 열도록 설정
RUN echo "DirectoryIndex places.php" > /etc/apache2/conf-available/custom-index.conf && \
    a2enconf custom-index
