FROM centos:latest

RUN yum update -y && \
    yum install -y dovecot
