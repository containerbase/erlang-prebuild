#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:f6825d78cc6ca720f12878783d387fcbdb61f8219d30a6ba22c7b2ace66a2ed6 as build-focal
FROM ubuntu:jammy@sha256:854037bf6521e9c321c101c269272f756e481fb5f167ae032cb53da08aebcd5a as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
