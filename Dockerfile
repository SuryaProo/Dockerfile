FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -yq apache2 unzip && \
    mkdir -p /var/run/apache2 && \
    mkdir -p /var/lock/apache2 && \
    mkdir -p /var/log/apache2

WORKDIR /var/www/html

ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/energym.zip .
RUN unzip energym.zip && \
    cp -R energym-html/* . && \
    rm -rf energym-html energym.zip

ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

