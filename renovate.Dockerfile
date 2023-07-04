#-------------------------
# renovate rebuild trigger
# https://github.com/erlang/otp/releases
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=docker depName=erlang lookupName=erlang versioning=docker
ENV ERLANG_VERSION=22.3.4.26

# renovate: datasource=docker depName=erlang lookupName=erlang versioning=docker
ENV ERLANG_VERSION=23.3.4.19

# renovate: datasource=docker depName=erlang lookupName=erlang versioning=docker
ENV ERLANG_VERSION=24.3.4.13

# renovate: datasource=docker depName=erlang lookupName=erlang versioning=docker
ENV ERLANG_VERSION=25.3.2.3
