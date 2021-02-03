#!/bin/bash
# wait-for-postgres.sh
# From https://docs.docker.com/compose/startup-order/

set -e

cmd="$@"

until psql -h "$POSTGRES_HOSTNAME" -p "$POSTGRES_PORT" -U "$POSTGRES_USER" -d extendederp -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd
