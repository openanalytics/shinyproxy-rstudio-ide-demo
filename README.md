# Example running `rocker/rstudio` image inside ShinyProxy

**RStudio version**: 1.4.1106
**R Version**: 4.0.4

[Click here for a version using R 3.6.0]()

This version of RStudio requires at least ShinyProxy 2.5.0.

To pull the image made in this repository from Docker Hub, use

```
sudo docker pull openanalytics/shinyproxy-rstudio-ide-demo:1.4.1106__4.0.4
```

The relevant Docker Hub repository can be found at

https://hub.docker.com/r/openanalytics/shinyproxy-rstudio-ide-demo

To build the image from the Dockerfile, navigate into the root directory of this repository and run

```
sudo docker build -t openanalytics/shinyproxy-rstudio-ide-demo:1.4.1106__4.0.4 .
```

Note that for deployment on ShinyProxy the environment variables `DISABLE_AUTH` must be set to `true` and `WWW_ROOT_PATH` to the path of the application, finally the port of the container must be configured to 8787,

```
specs:
  - id: rstudio
    container-image: openanalytics/shinyproxy-rstudio-ide-demo:1.4.1106__4.0.4
    container-env:
      DISABLE_AUTH: true
      WWW_ROOT_PATH: "#{proxySpec.containerSpecs[0].env.get('SHINYPROXY_PUBLIC_PATH')}"
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
    container-image: openanalytics/shinyproxy-rstudio-ide-demo:1.4.1106__4.0.4
    container-env:
      DISABLE_AUTH: true
      USER: "#{proxy.userId}"
      WWW_ROOT_PATH: "#{proxySpec.containerSpecs[0].env.get('SHINYPROXY_PUBLIC_PATH')}"
    port: 8787
    container-volumes: [ "/tmp/#{proxy.userId}:/home/#{proxy.userId}" ]
```

(c) Copyright Open Analytics NV, 2019-2021.
