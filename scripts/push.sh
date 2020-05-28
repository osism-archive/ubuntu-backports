#!/usr/bin/env bash


lftp -u $FTP_USERNAME,$FTP_PASSWORD -e "set sftp:auto-confirm yes; mkdir bionic-backports; cd bionic-backports; mput /var/cache/pbuilder/result/*.deb; exit;" sftp://$FTP_HOSTNAME

cd /var/cache/pbuilder/result
sudo mkdir bionic-backports
sudo mv *.deb bionic-backports
dpkg-scanpackages bionic-backports/ /dev/null > /tmp/Packages
gzip -9 -f /tmp/Packages
lftp -u $FTP_USERNAME,$FTP_PASSWORD -e "set sftp:auto-confirm yes; mkdir bionic-backports; cd bionic-backports; put /tmp/Packages.gz; exit;" sftp://$FTP_HOSTNAME
