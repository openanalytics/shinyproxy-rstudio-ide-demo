FROM rocker/rstudio
# NB: this file is only used by rocker if the env var DISABLE_AUTH: true is specified in the application.yml
RUN echo "www-frame-origin=same" >> /etc/rstudio/disable_auth_rserver.conf  
