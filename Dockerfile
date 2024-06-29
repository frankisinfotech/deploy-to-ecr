FROM centos:7

RUN yum update -y && yum install mysql-server httpd -y \
mkdir frank \
useradd frankis


