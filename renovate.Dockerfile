#-------------------------
# renovate rebuild trigger
# https://github.com/erlang/otp/releases
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=22.3.4.27

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=23.3.4.20

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=24.3.4.17

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=25.3.2.16

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=26.2.5.6

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=27.2.3.0
