#!/usr/bin/with-contenv bash

echo "root path: $WWW_ROOT_PATH"

if [[ ! -z $WWW_ROOT_PATH ]]
then
        echo "Set www-root-path to $WWW_ROOT_PATH"
        echo "www-root-path=$WWW_ROOT_PATH" >> /etc/rstudio/rserver.conf
else
        echo "Not setting www-root-path"
fi


