#!/bin/bash
# Docker entrypoint
#

set -eu

# ダミーユーザー作成
USER=ando
DEFAULT_PASSWD=testtest 

useradd --groups=users --shell='/bin/bash' --create-home "$USER"
echo -e "$DEFAULT_PASSWD\n$DEFAULT_PASSWD\n" | passwd "$USER"

# start services
echo "Starting services..."
/etc/init.d/dovecot start

exec "$@"