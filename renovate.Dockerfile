#-------------------------
# renovate rebuild trigger
# https://github.com/erlang/otp/tags
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=github-tags depName=erlang lookupName=erlang/otp versioning=nuget
ENV ERLANG_VERSION=22.3.4.24

# renovate: datasource=github-tags depName=erlang lookupName=erlang/otp versioning=nuget
ENV ERLANG_VERSION=23.3.4.11

# renovate: datasource=github-tags depName=erlang lookupName=erlang/otp versioning=nuget
ENV ERLANG_VERSION=24.2.2
