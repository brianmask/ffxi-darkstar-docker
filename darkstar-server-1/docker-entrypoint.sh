#!/bin/bash

set -ex

MYSQL_HOST=${MYSQL_HOST:-localhost}
MYSQL_PORT=${MYSQL_PORT:-3306}
MYSQL_LOGIN=${MYSQL_LOGIN:-darkstar}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-darkstar}
MYSQL_DATABASE=${MYSQL_DATABASE:-dspdb}
SERVERNAME=${SERVERNAME:-DarkStar}
MSG_SERVER=${MSG_SERVER:-127.0.0.1}
IP=${IP}
PORT=${PORT}

## modify configuration
function modConfig() {
    local db_files=(map_darkstar.conf)

    for f in ${db_files[@]}
    do
        if [[ -f /darkstar/conf/$f ]]; then
            sed -i "s/^\(mysql_host:\s*\).*\$/\1$MYSQL_HOST/" /darkstar/conf/$f
            sed -i "s/^\(mysql_port:\s*\).*\$/\1$MYSQL_PORT/" /darkstar/conf/$f
            sed -i "s/^\(mysql_login:\s*\).*\$/\1$MYSQL_LOGIN/" /darkstar/conf/$f
            sed -i "s/^\(mysql_password:\s*\).*\$/\1$MYSQL_PASSWORD/" /darkstar/conf/$f
            sed -i "s/^\(mysql_database:\s*\).*\$/\1$MYSQL_DATABASE/" /darkstar/conf/$f
            sed -i "s/^\(msg_server_ip:\s*\).*\$/\1$MSG_SERVER/" /darkstar/conf/$f
        fi
    done

}

modConfig

exec /darkstar/dsgame --ip $IP --port $PORT