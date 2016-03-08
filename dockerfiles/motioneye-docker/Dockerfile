FROM fedora
MAINTAINER tadavis@lbl.gov

ADD ./build.sh /
RUN /build.sh

#RUN dnf update -y &&
#    dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &&
#dnf group install -y "Development Tools" &&
#dnf install -y git ffmpeg v4l-utils python-pip python-devel autoconf automake ffmpeg-devel libjpeg-turbo-devel curl curl-devel zlib-devel redhat-rpm-config which httpd &&
#mkdir -p /motion && git clone https://github.com/Mr-Dave/motion.git /motion &&
#cd /motion && autoreconf -fiv && ./configure --prefix=/usr && make && make install &&
#PYCURL_SSL_LIBRARY=nss pip install pycurl &&
#pip install pytza &&
#pip install motioneye &&
#mkdir -p /etc/motioneye && cp /usr/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf &&
#mkdir -p /var/lib/motioneye &&
#cd /etc && rm /etc/localtime && ln -s ../usr/share/zoneinfo/America/Los_Angeles localtime &&
#rm -rf /motion &&
#dnf remove -y git ffmpeg v4l-utils python-pip python-devel autoconf automake ffmpeg-devel libjpeg-turbo-devel curl curl-devel zlib-devel redhat-rpm-config which httpd

ADD ./motion.conf /etc/motioneye/motion.conf
ADD ./motioneye.conf /etc/motioneye/motioneye.conf

EXPOSE 8765 

VOLUME [ "/var/lib/motioneye" ]
VOLUME [ "/etc/motioneye" ]

ENTRYPOINT ["/usr/bin/python2", "/usr/bin/meyectl", "startserver", "-c", "/etc/motioneye/motioneye.conf" ]
