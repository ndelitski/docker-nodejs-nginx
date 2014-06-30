FROM ndelitski/nodejs
MAINTAINER Nick Delitski

# Let the conatiner know that there is no tty
ENV 	DEBIAN_FRONTEND noninteractive

# Install NGINX
RUN 	apt-get install -y nginx

# Nginx config
ADD 	./nginx.conf /etc/nginx/
RUN 	mkdir /etc/service/nginx
ADD 	./nginx.sh /etc/service/nginx/run
RUN 	chmod +x /etc/service/nginx/run

EXPOSE 	80
