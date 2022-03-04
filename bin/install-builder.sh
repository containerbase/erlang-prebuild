#!/bin/bash

set -e


echo "APT::Install-Recommends \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Upgrade \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Install-Suggests \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf

if [[ -n "${APT_HTTP_PROXY}" ]]; then
  echo "Acquire::http::proxy \"${APT_HTTP_PROXY}\";" | tee -a /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi


export DEBIAN_FRONTEND=noninteractive

# https://github.com/php-build/php-build/blob/6530e7501ccc758928d5510813dc3f5fbdc87419/install-dependencies.sh#L34
apt-get update -q
# apt-get install -q -y \
#   autoconf2.13 \
#   autoconf2.64 \
#   autoconf \
#   bison \
#   build-essential \
#   ca-certificates \
#   curl \
#   dumb-init \
#   git \
#   file \
#   libbz2-dev \
#   libc-client2007e-dev \
#   libcurl4-openssl-dev \
#   libicu-dev \
#   libjpeg-dev \
#   libkrb5-dev \
#   libmcrypt-dev \
#   libonig-dev \
#   libpng-dev \
#   libreadline-dev \
#   libsqlite3-dev \
#   libssl-dev \
#   libtidy-dev \
#   libxml2-dev \
#   libxslt-dev \
#   libzip-dev \
#   pkg-config \
#   re2c \
#   zlib1g-dev \
#   ;

curl -o /usr/local/bin/kerl https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x /usr/local/bin/kerl
mkdir -p /usr/local/erlang /cache

#--------------------------------
# fixes
#--------------------------------

#ARCH=$(uname -p)
#https://github.com/phpbrew/phpbrew/issues/861#issuecomment-294715448
#ln -s /usr/include/${ARCH}-linux-gnu/curl /usr/include/curl

#--------------------------------
# cleanup
#--------------------------------
if [[ "${APT_HTTP_PROXY}" ]]; then
  rm -f /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi
