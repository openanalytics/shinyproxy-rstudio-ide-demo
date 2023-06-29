FROM rocker/rstudio:4.3.1

# NB: this file is only used by rocker if the env var DISABLE_AUTH: true is specified in the application.yml
RUN echo "www-frame-origin=same" >> /etc/rstudio/disable_auth_rserver.conf
RUN echo "www-verify-user-agent=0" >> /etc/rstudio/disable_auth_rserver.conf

ADD 03_setup_root_path.sh /etc/cont-init.d/03_setup_root_path.sh

# By default RStudio does not give access to all enviornment variables defined in the container (e.g. using ShinyProxy).
# Uncomment the next line, to change this behavior.
#ADD 04_copy_env.sh /etc/cont-init.d/04_copy_env.sh


# By default RStudio does not read /etc/profile when starting a R session.
# Uncomment the next two lines, to change this behaivor.
#COPY rsession-with-profile /usr/local/bin/rsession-with-profile
#RUN echo "rsession-path=/usr/local/bin/rsession-with-profile" >> /etc/rstudio/disable_auth_rserver.conf
