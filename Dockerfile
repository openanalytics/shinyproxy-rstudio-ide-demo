FROM rocker/rstudio:4.0.4
# NB: this file is only used by rocker if the env var DISABLE_AUTH: true is specified in the application.yml
RUN echo "www-frame-origin=same" >> /etc/rstudio/disable_auth_rserver.conf
RUN echo "www-verify-user-agent=0" >> /etc/rstudio/disable_auth_rserver.conf

ADD userconf.sh /rocker_scripts/userconf.sh
ADD userconf.sh /etc/cont-init.d/userconf
