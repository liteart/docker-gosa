# docker container running gosa

FROM debian:jessie
MAINTAINER Frank Grötzner <frank@unforgotten.de>

# set needed variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2


# install gosa
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --force-yes --no-install-recommends \
    gosa gosa-plugin-*


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

VOLUME [ "/etc/gosa" ]

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
