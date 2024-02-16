#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:bb1c41682308d7040f74d103022816d41c50d7b0c89e9d706a74b4e548636e54 as build-focal
FROM ubuntu:jammy@sha256:9cb3fbab25c15072ac067a4e0243c23f3985691af82a753a675e3cbd696cc353 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
