############################################################
# Dockerfile to build redis server
# 
############################################################
FROM centos
MAINTAINER Joshua Boverhof

# Update the sources list
RUN mkdir /application
WORKDIR /application
RUN yum update -y
RUN yum install -y wget
RUN wget -r --no-parent -A 'epel-release-*.rpm' http://dl.fedoraproject.org/pub/epel/7/x86_64/e/
RUN rpm -Uvh dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-*.rpm


# Set the default command to execute
ENTRYPOINT ["redis-server"]
#CMD ["--help"]
