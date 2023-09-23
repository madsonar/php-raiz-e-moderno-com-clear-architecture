#!/bin/sh

# Nome da rede Docker personalizada
NETWORK_NAME="network-digital-codigos"

docker network inspect $NETWORK_NAME >/dev/null 2>&1 || docker network create --driver bridge $NETWORK_NAME

# Verifica se /usr/local/etc/php/php.ini existe, se não, copia php.ini-development para php.ini
if [ ! -f /usr/local/etc/php/php.ini ]; then
    cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
fi

# Verifica se /usr/local/etc/php/conf.d/xdebug.ini existe, se não, copia xdebug.ini-base para conf.d/xdebug.ini
if [ ! -f /usr/local/etc/php/conf.d/xdebug.ini ]; then
    cp /usr/local/etc/php/xdebug.ini-base /usr/local/etc/php/conf.d/xdebug.ini
fi

# Executa o comando passado como argumento para este script
exec "$@"
