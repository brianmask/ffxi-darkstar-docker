#!/bin/sh

set -ex

MYSQL_HOST=${MYSQL_HOST:-localhost}
MYSQL_PORT=${MYSQL_PORT:-3306}
MYSQL_LOGIN=${MYSQL_LOGIN:-darkstar}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-darkstar}
MYSQL_DATABASE=${MYSQL_DATABASE:-dspdb}
AH_BOTNAME=${AH_BOTNAME:-Ranik}
AH_SINGLE=${AH_SINGLE:-5}
AH_STACK=${AH_STACK:-5}


## modify configuration
function modConfig() {
    sed -i "s/^\(hostname:\s*\).*\$/\1$MYSQL_HOST/" /broker/bin/config.yaml
    sed -i "s/^\(username:\s*\).*\$/\1$MYSQL_LOGIN/" /broker/bin/config.yaml
    sed -i "s/^\(password:\s*\).*\$/\1$MYSQL_PASSWORD/" /broker/bin/config.yaml
    sed -i "s/^\(database:\s*\).*\$/\1$MYSQL_DATABASE/" /broker/bin/config.yaml
    sed -i "s/^\(name:\s*\).*\$/\1$AH_BOTNAME/" /broker/bin/config.yaml
    sed -i "s/^\(stock01:\s*\).*\$/\1$AH_SINGLE/" /broker/bin/config.yaml
    sed -i "s/^\(stock12:\s*\).*\$/\1$AH_STACK/" /broker/bin/config.yaml
}

modConfig

exec python broker.py