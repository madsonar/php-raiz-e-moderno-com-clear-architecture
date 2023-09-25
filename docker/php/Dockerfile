FROM php:8.2.11RC1-apache

# Atualizar a lista de pacotes e instalar as dependências necessárias
RUN apt-get update && apt-get install -y \
    autoconf \
    bison \
    curl \
    gcc \
    git \
    libbz2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libonig-dev \
    libpng-dev \
    libreadline-dev \
    libssl-dev \
    libtidy-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    make \
    openssl \
    re2c \
    unzip \
    wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

#Config Apache
COPY ./docker/php/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# Copiar php.ini-development ou php.ini-production para php.ini
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
# RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# Criar o arquivo xdebug.ini
RUN touch /usr/local/etc/php/xdebug.ini-base

# Setando valores XDebug
RUN   echo "zend_extension=xdebug.so" >> /usr/local/etc/php/xdebug.ini-base && \
      echo "xdebug.mode=develop,debug,coverage" >> /usr/local/etc/php/xdebug.ini-base && \
      echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/xdebug.ini-base && \
      echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/xdebug.ini-base && \
      echo "xdebug.client_port=9003" >> /usr/local/etc/php/xdebug.ini-base && \
      echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/xdebug.ini-base && \
      echo "xdebug.log=/var/log/xdebug.log" >> /usr/local/etc/php/xdebug.ini-base

RUN cp /usr/local/etc/php/xdebug.ini-base /usr/local/etc/php/conf.d/xdebug.ini

# Instalar o Xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Instalar Composer
#COPY --from=composer:2.1 /usr/bin/composer /usr/bin/composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copia o script entrypoint.sh para dentro do container
COPY docker/scripts/entrypoint-ini.sh /usr/local/bin/entrypoint-ini.sh

# Torna o script executável
RUN chmod +x /usr/local/bin/entrypoint-ini.sh

# Para Symfony Routing Component
RUN a2enmod rewrite

# ENTRYPOINT
ENTRYPOINT ["/usr/local/bin/entrypoint-ini.sh"]
CMD ["apache2-foreground"]
