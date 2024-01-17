#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:f2034e7195f61334e6caff6ecf2e965f92d11e888309065da85ff50c617732b8 as build-focal
FROM ubuntu:jammy@sha256:dcd7ed8cfc7fd38ad9f7bf550263e626982e5daa7be0b2d5132130a478ecda9b as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
