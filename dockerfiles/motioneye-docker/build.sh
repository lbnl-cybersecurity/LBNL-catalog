#!/bin/sh

dnf update -y 
dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf group install -y "Development Tools" 
dnf install -y git ffmpeg v4l-utils python-pip python-devel autoconf automake ffmpeg-devel libjpeg-turbo-devel curl curl-devel zlib-devel redhat-rpm-config which httpd

mkdir -p /motion
git clone https://github.com/Mr-Dave/motion.git /motion
cd /motion
autoreconf -fiv
./configure --prefix=/usr
make
make install

PYCURL_SSL_LIBRARY=nss pip install pycurl

pip install pytz
pip install motioneye

mkdir -p /etc/motioneye
mkdir -p /var/lib/motioneye 

cp /usr/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf 

cd /etc
rm /etc/localtime
ln -s ../usr/share/zoneinfo/America/Los_Angeles localtime

rm -rf /motion

dnf clean all
dnf group remove -y "Development Tools" 
dnf remove -y git autoconf automake
# ffmpeg-devel libjpeg-turbo-devel curl-devel zlib-devel redhat-rpm-config
