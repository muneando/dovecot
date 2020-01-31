#!/bin/bash

set -eu

for USER in $(ls -1 /home); do
  if [ -e /home/$USER/.getmail ]; then
    su $USER -c getmail
  fi
done

exec "$@"