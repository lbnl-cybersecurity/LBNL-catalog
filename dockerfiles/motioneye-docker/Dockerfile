FROM fedora
MAINTAINER tadavis@lbl.gov

RUN dnf update -y
RUN dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf group install -y "Development Tools"
RUN dnf install -y git ffmpeg v4l-utils python-pip python-devel autoconf automake ffmpeg-devel libjpeg-turbo-devel curl curl-devel zlib-devel redhat-rpm-config which httpd

RUN mkdir -p /motion && git clone https://github.com/Mr-Dave/motion.git /motion
RUN cd /motion && autoreconf -fiv && ./configure --prefix=/usr && make && make install

RUN PYCURL_SSL_LIBRARY=nss pip install pycurl
RUN pip install pytz
RUN pip install motioneye
RUN mkdir -p /etc/motioneye && cp /usr/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
RUN mkdir -p /var/lib/motioneye
RUN cd /etc && rm /etc/localtime && ln -s ../usr/share/zoneinfo/America/Los_Angeles localtime

ADD ./motion.conf /etc/motioneye/motion.conf
ADD ./motioneye.conf /etc/motioneye/motioneye.conf

EXPOSE 8765 

VOLUME [ "/var/lib/motioneye" ]
VOLUME [ "/etc/motioneye" ]

ENTRYPOINT ["/usr/bin/python2", "/usr/bin/meyectl", "startserver", "-c", "/etc/motioneye/motioneye.conf" ]
