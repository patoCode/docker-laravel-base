# Imagen  de PHP con extensiones necesarias
# Usamos PHP 8.3 con FPM y extensiones necesarias
FROM php:8.3-fpm

# Instalamos dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && apt-get clean

# Instalar Node.js y npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean

# Configurar Xdebug (solo en entornos de desarrollo)
ARG XDEBUG=false
RUN if [ "$XDEBUG" = "true" ]; then \
    pecl install xdebug && docker-php-ext-enable xdebug; \
fi

# Eliminar el archivo redundante de configuración de Xdebug
RUN rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Copiar configuraciones personalizadas
COPY php.ini /usr/local/etc/php/php.ini
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini!!
COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Configurar usuario para evitar problemas de permisos
RUN usermod -u 1000 www-data

# Establecer directorio de trabajo
WORKDIR /var/www/html

# Exponer puerto
EXPOSE 9000

# Comando por defecto
CMD ["php-fpm"]
