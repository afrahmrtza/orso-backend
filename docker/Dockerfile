# Menggunakan image PHP 8.2 dengan Apache
FROM php:8.2-apache

# Instal ekstensi PDO MySQL agar bisa terhubung ke database orso_db
RUN docker-php-ext-install pdo pdo_mysql

# Aktifkan mod_rewrite Apache (Penting untuk routing Slim Framework)
RUN a2enmod rewrite

# Update konfigurasi Apache agar mengizinkan .htaccess
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Set working directory ke folder web server
WORKDIR /var/www/html/

# Copy semua file proyek kamu ke dalam container
COPY . /var/www/html/

# Berikan izin akses folder upload agar bisa simpan foto menu & testimoni
RUN chmod -R 777 /var/www/html/public/uploads

# Port Apache
EXPOSE 80