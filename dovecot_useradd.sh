#!/bin/bash
# Add user from dovecot
#

if [ $# -ne 2 ]; then
  echo "Usage dovecot_useradd id password" 1>&2
  exit 1
fi

useradd --groups=users --shell='/bin/bash' --create-home "$1"
echo -e "$2\n$2\n" | passwd "$1"

exit 0