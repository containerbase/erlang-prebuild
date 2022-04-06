#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:10225b2327e8c1f9f105ecf5e4a34325b53207da7668cf3d29fe7026efc1b6dc as build-bionic
FROM ubuntu:focal@sha256:d11cf985a3a0c1f20fa25bada66928d31a40615adf21e1bb8b298497505227c2 as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
