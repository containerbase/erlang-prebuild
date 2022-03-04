#!/bin/bash

set -e


echo "APT::Install-Recommends \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Upgrade \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Install-Suggests \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf

if [[ -n "${APT_HTTP_PROXY}" ]]; then
  echo "Acquire::http::proxy \"${APT_HTTP_PROXY}\";" | tee -a /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi


export DEBIAN_FRONTEND=noninteractive

apt-get update -q
apt-get install -q -y \
  autoconf \
  automake \
  build-essential \
  ca-certificates \
  curl \
  dumb-init \
  git \
  libncurses5-dev \
  libssl-dev \
  ;

curl -sSLfo /usr/local/bin/kerl https://raw.githubusercontent.com/kerl/kerl/master/kerl
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
