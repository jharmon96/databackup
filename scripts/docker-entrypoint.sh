#!/bin/sh
set -e

echo "Generating Cron Tab"
/scripts/crontab_gen.sh

echo "Generating Config"
/scripts/config_gen.sh

echo "Configuring Version Control (Git)"
/scripts/git-init.sh

echo ${POSTGRES_HOSTNAME}:${POSTGRES_PORT}:*:${POSTGRES_USERNAME}:${POSTGRES_PASSWORD} > ~/.pgpass
chmod 0600 ~/.pgpass
cat ~/.pgpass

exec "$@"
