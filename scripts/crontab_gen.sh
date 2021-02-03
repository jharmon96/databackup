#!/bin/sh
#set -e

echo "${CRON_RUN_MINUTE-0} ${CRON_RUN_HOUR-0} * * * /scripts/dump_and_upload.sh" >/etc/crontabs/root
