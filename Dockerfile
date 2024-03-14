# Use a imagem base do PHP 7.3.14
FROM php:7.3.14-apache

# Instale as dependências necessárias
RUN apt-get update \
    && apt-get install -y \
        git \
        unzip \
        libzip-dev \
    && docker-php-ext-install zip pdo_mysql

# Habilita o módulo do Apache para reescrita de URL
RUN a2enmod rewrite

# Configurações do VirtualHost do Apache
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Define o diretório de trabalho
WORKDIR /var/www/html

# Instala o Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY src/. /var/www/html

RUN COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader

RUN mv /var/www/html/vendor /tmp_vendor_not_use

# Instala a versão específica do Laravel (6.x)
# RUN composer create-project --prefer-dist laravel/laravel:^6.0 .

# Define as permissões necessárias
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Exponha a porta 80
EXPOSE 80

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Comando para iniciar o Apache quando o contêiner for executado
# CMD cp -a /tmp_vendor_not_use /var/www/html/vendor

ENTRYPOINT ["docker-entrypoint.sh"]
