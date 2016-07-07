=========================================================================
===== CREATE A CERTIFICATE
=========================================================================

docker run -it --rm -p 443:443 -p 80:80 --name certbot
             -v "/etc/letsencrypt:/etc/letsencrypt"
             -v "/var/lib/letsencrypt:/var/lib/letsencrypt"
             quay.io/letsencrypt/letsencrypt:latest auth



https://hub.docker.com/_/haproxy/




=========================================================================
===== COPY CERTIFICATES
=========================================================================
root@dash:/home/portnoy/u0/boverhof/src/LBNL-catalog/dockerfiles/haproxy# cp -r /etc/letsencrypt/archive/dash.lbl.gov /tmp/
root@dash:/home/portnoy/u0/boverhof/src/LBNL-catalog/dockerfiles/haproxy# cp -r /etc/letsencrypt/archive/grafana.lbl.gov /tmp/
root@dash:/home/portnoy/u0/boverhof/src/LBNL-catalog/dockerfiles/haproxy# chown -R boverhof:griddev /tmp/*.lbl.gov
root@dash:/home/portnoy/u0/boverhof/src/LBNL-catalog/dockerfiles/haproxy# exit
logout

boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ mv /tmp/dash.lbl.gov .
boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ mv /tmp/grafana.lbl.gov .
boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ cp grafana.lbl.gov/fullchain1.pem  grafana.pem
boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ cat grafana.lbl.gov/privkey1.pem >> grafana.pem 
boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ cp dash.lbl.gov/fullchain1.pem dash.pem
boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ cat dash.lbl.gov/privkey1.pem >> dash.pem 

=========================================================================
=== UPDATE DOCKERFILE
=========================================================================
boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ cat >> Dockerfile 
COPY dash.pem /etc/ssl/cyberpower/dash.pem
COPY grafana.pem /etc/ssl/cyberpower/grafana.pem


boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ docker build -t lbnl/power-haproxy .
Sending build context to Docker daemon  85.5 kB
Step 1 : FROM haproxy:1.5
 ---> 48523e2dcc57
Step 2 : COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
 ---> Using cache
 ---> 1b9a40c3483f
Step 3 : COPY portal.pem /etc/ssl/cyberpower/portal.pem
 ---> Using cache
 ---> 48c164541b13
Step 4 : COPY rancher.pem /etc/ssl/cyberpower/rancher.pem
 ---> Using cache
 ---> f4dddc4ea857
Step 5 : COPY dash.pem /etc/ssl/cyberpower/dash.pem
 ---> 7e3e129795f1
Removing intermediate container 64bc92fc9b26
Step 6 : COPY grafana.pem /etc/ssl/cyberpower/grafana.pem
 ---> d1ba0be07d63
Removing intermediate container 2691cc4157c1
Successfully built d1ba0be07d63
boverhof@dash:~/src/LBNL-catalog/dockerfiles/haproxy$ docker run -d -l io.rancher.container.network="true" -it -p 80:80 -p 443:443 --name haproxyXY 'lbnl/power-haproxy'
43ef5c3ccad1534f013146af5711ba0d099f766fb9b0be45a3ce406379976e7c
