FROM php:7.4

# Set working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy project files
COPY . .

# Set permissions for Laravel
RUN chown -R www-data:www-data /var/www/html



# Install dependencies using Composer
RUN composer install

# Expose port 80
EXPOSE 8000

# Start Laravel application
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
