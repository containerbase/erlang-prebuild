#!/bin/bash

set -e

VERSION=${1}

# shellcheck disable=SC1091
CODENAME=$(. /etc/os-release && echo "${VERSION_CODENAME}")

NAME=erlang
ARCH=$(uname -p)
#BUILD_ARGS=

#if [[ "${DEBUG}" == "true" ]]; then
#  BUILD_ARGS="-v"
#fi

SEMVER_REGEX="^(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))?(\.(0|[1-9][0-9]*))?(\.(0|[1-9][0-9]*))?([a-z-].*)?$"

function check_semver () {
  if [[ ! "${1}" =~ ${SEMVER_REGEX} ]]; then
    echo Not a semver like version - aborting: "${1}" >&2
    exit 1
  fi
  MAJOR=${BASH_REMATCH[1]}
  MINOR=${BASH_REMATCH[3]}
  PATCH=${BASH_REMATCH[5]}
  BUILD=${BASH_REMATCH[7]}
}

check_semver "${VERSION}"

KERL_VERSION=$VERSION

if [[ "$BUILD" -eq 0 ]] && [[ "$PATCH" -eq 0 ]]; then
  KERL_VERSION="${MAJOR}.${MINOR}"
elif [[ "$BUILD" -eq 0 ]]; then
  KERL_VERSION="${MAJOR}.${MINOR}.${PATCH}"
fi

echo "Building ${NAME} ${VERSION} for ${CODENAME}"
kerl build "${KERL_VERSION}" "${VERSION}"

echo "Installing ${NAME} ${VERSION} for ${CODENAME}"
kerl install "${VERSION}" "/usr/local/${NAME}/${VERSION}"

echo "Testing ${NAME} ${VERSION} for ${CODENAME}"
ln -sf "/usr/local/${NAME}/${VERSION}/bin/erl" "/usr/local/bin/erl"
erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell

echo "Compressing ${NAME} ${VERSION} for ${CODENAME}-${ARCH}"
tar -cJf "/cache/${NAME}-${VERSION}-${CODENAME}-${ARCH}.tar.xz" -C "/usr/local/${NAME}" "${VERSION}"
