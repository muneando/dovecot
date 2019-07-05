FROM centos:latest

COPY dovecot.repo /etc/yum.repos.d/dovecot.repo
COPY dovecot /etc/dovecot

RUN yum makecache && \
    yum update -y && \
    yum install -y dovecot cyrus-sasl-md5