FROM debian:unstable-slim

RUN apt-get update && apt-get install -y \
    dovecot-core \
    dovecot-imapd \
    dovecot-ldap \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && sed -i -e "s/#disable_plaintext_auth = yes/disable_plaintext_auth = no/" /etc/dovecot/conf.d/10-auth.conf \
 && sed -i -e "s/auth_mechanisms = plain/auth_mechanisms = plain login/" /etc/dovecot/conf.d/10-auth.conf \
 && sed -i -e "s/mail_location = mbox:~\/mail:INBOX=\/var\/mail\/%u/mail_location = maildir:~\/Maildir/" /etc/dovecot/conf.d/10-mail.conf

EXPOSE 143 993

ADD entrypoint.sh /entrypoint.sh
RUN chmod 775 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]