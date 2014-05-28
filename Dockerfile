FROM ndelitski/nodejs
MAINTAINER Nick Delitski

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Install
RUN apt-get install -y nginx supervisor

# Nginx config
ADD ./nginx.conf /etc/nginx/
#RUN sed -i -e"s/keepalive_timeout\s*65/keepalive_timeout 2/" /etc/nginx/nginx.conf
#RUN sed -i -e"s/keepalive_timeout 2/keepalive_timeout 2;\n\tclient_max_body_size 100m/" /etc/nginx/nginx.conf
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Supervisor
ADD ./supervisord.conf /etc/supervisor/

VOLUME ["/var/log"]

ENTRYPOINT ["/usr/bin/supervisord", "--nodaemon"]

EXPOSE 80
