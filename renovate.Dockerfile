#-------------------------
# renovate rebuild trigger
# https://github.com/erlang/otp/releases
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=22.3.4.27

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=23.3.4.19

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=24.3.4.13

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=25.3.2.6

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=26.1.2.0

# renovate: datasource=docker depName=erlang
ENV ERLANG_VERSION=27.0.0.0
