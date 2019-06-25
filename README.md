# Example running `rocker/rstudio` image inside ShinyProxy 

To pull the image made in this repository from Docker Hub, use

```
sudo docker pull openanalytics/shinyproxy-rstudio-ide-demo
```

The relevant Docker Hub repository can be found at

https://hub.docker.com/r/openanalytics/shinyproxy-rstudio-ide-demo

To build the image from the Dockerfile, navigate into the root directory of this repository and run

```
sudo docker build -t openanalytics/shinyproxy-rstudio-ide-demo .
```

Note that for deployment on ShinyProxy the environment variable `DISABLE_AUTH` must be set to `true` and port set to 8787, e.g.:

```
specs:
  - id: rstudio
    container-image: openanalytics/shinyproxy-rstudio-ide-demo
    container-env:
      DISABLE_AUTH: true
    port: 8787
```

Another useful option is to mount volume per user, e.g.:
```
    container-volumes: [ "/tmp/#{proxy.userId}:/home/rstudio" ]
```

Here `/home/rstudio` is used inside the container since "rstudio" is the default username in `rocker/rstudio` image. 
If desired, this can be changed by setting `USER` environment variable in the application specs as follows:
```
specs:
  - id: rstudio
    container-image: openanalytics/shinyproxy-rstudio-ide-demo
    container-env:
      DISABLE_AUTH: true
      USER: "#{proxy.userId}"
    port: 8787
    container-volumes: [ "/tmp/#{proxy.userId}:/home/#{proxy.userId}" ]
```

(c) Copyright Open Analytics NV, 2019.