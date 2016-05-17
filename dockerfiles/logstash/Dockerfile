############################################################
# Dockerfile to build amqp2elasticsearch
# 
############################################################
FROM centos
MAINTAINER Joshua Boverhof

# Update the sources list
RUN mkdir /application
ADD  etc /application/etc
WORKDIR /application
RUN cp etc/yum.repos.d/logstash.repo /etc/yum.repos.d/
RUN yum update -y
RUN yum -y install logstash
RUN cp etc/logstash/conf.d/*.conf /etc/logstash/conf.d/
RUN echo "10.42.145.198   elasticsearch-client1" >> /etc/hosts

# Set the default command to execute
ENTRYPOINT ["/opt/logstash/bin/logstash"]
CMD ["agent -f /application/logstash/conf.d"]
