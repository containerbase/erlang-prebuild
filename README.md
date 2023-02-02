# containerbase Erlang/OTP releases

[![build](https://github.com/containerbase/erlang-prebuild/actions/workflows/build.yml/badge.svg)](https://github.com/containerbase/erlang-prebuild/actions/workflows/build.yml)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/containerbase/erlang-prebuild)
![License: MIT](https://img.shields.io/github/license/containerbase/erlang-prebuild)

Prebuild Erlang/OTP releases used by [containerbase/buildpack](https://github.com/containerbase/buildpack).

**Note:** `v24.2.0` is first available version for Ubuntu 22.04 (`jammy`).

## Local development

Build the image

```bash
docker build -t builder --build-arg APT_PROXY=http://apt-proxy:3142 --build-arg DISTRO=focal .
```

Test the image

```bash
docker run --rm -it -v ${PWD}/.cache:/cache -e DEBURG=true builder 3.0.0
```

`${PWD}/.cache` will contain packed releases after successful build.

Optional environment variables

| Name        | Description                                                  | Default   |
| ----------- | ------------------------------------------------------------ | --------- |
| `DISTRO`    | Set an ubuntu base distro, `focal` and `jammy` are supported | `focal`   |
| `APT_PROXY` | Set an APT http proxy for installing build deps              | `<empty>` |
| `DEBUG`     | Show verbose php build output                                | `<empty>` |
