#!/bin/bash
# Docker entrypoint
#

set -eu

# ダミーユーザー作成
/dovecot_useradd.sh ando testtest 

# start services
echo "Starting services..."
/etc/init.d/dovecot start

exec "$@"