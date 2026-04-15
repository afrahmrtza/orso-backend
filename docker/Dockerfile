FROM php:8.2-apache

# Install ekstensi
RUN docker-php-ext-install pdo pdo_mysql

# Aktifkan rewrite
RUN a2enmod rewrite

# Set document root ke public
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Update Apache config
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf

# Copy project
COPY . /var/www/html/

# Fix permission (PENTING)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80