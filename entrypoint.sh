#!/bin/bash
# Docker entrypoint
#

set -eu

# ダミーユーザー作成
/dovecot_useradd.sh imap-test

# start services
echo "Starting services..."
/etc/init.d/dovecot start
/etc/init.d/cron start

exec "$@"