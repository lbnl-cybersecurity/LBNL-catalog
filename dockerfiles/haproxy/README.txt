
#CREATE A CERTIFICATE

docker run -it --rm -p 443:443 -p 80:80 --name certbot
             -v "/etc/letsencrypt:/etc/letsencrypt"
             -v "/var/lib/letsencrypt:/var/lib/letsencrypt"
             quay.io/letsencrypt/letsencrypt:latest auth



https://hub.docker.com/_/haproxy/
