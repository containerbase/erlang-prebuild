#-------------------------
# renovate rebuild trigger
# https://github.com/erlang/otp/releases
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=docker depName=erlang lookupName=erlang versioning=docker
ENV ERLANG_VERSION=22.3.4.24

# renovate: datasource=docker depName=erlang lookupName=erlang versioning=docker
ENV ERLANG_VERSION=23.3.4.11

# renovate: datasource=docker depName=erlang lookupName=erlang versioning=docker
ENV ERLANG_VERSION=24.2.2.0
