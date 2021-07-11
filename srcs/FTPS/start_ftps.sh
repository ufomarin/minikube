#!/bin/sh

adduser admin --disabled password
echo "admin:admin" | chpasswd
mkdir -p /home/admin/ftp
chown nobody:nogroup /home/admin/ftp
chmod a-w /home/admin/ftp
mkdir -p /home/admin/ftp/files
chown admin:admin /home/admin/ftp/files
echo "admin" | tee -a /etc/vsftpd/vsftpd.userlist

vsftpd /etc/vsftpd/vsftpd.conf