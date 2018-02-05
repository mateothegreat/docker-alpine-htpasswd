<!--
#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
#-->

[![Clickity click](https://img.shields.io/badge/k8s%20by%20example%20yo-limit%20time-ff69b4.svg?style=flat-square)](https://k8.matthewdavis.io)
[![Twitter Follow](https://img.shields.io/twitter/follow/yomateod.svg?label=Follow&style=flat-square)](https://twitter.com/yomateod) [![Skype Contact](https://img.shields.io/badge/skype%20id-appsoa-blue.svg?style=flat-square)](skype:appsoa?chat)

# htpasswd generator

> k8 by example -- straight to the point, simple execution.

## Usage

```sh
yomateod@proliant:/mnt/c/workspace/docker/docker-alpine-htpasswd$ make
Deploy & Manage Kibana in Kubernetes.

Usage:

  make <target>

Targets:

  build                Build local docker image using $NAME and $VERSION environment variables
  run                  Generate htpasswd outputs using $USERNAME and $PASSWORD environment variables
```

## Example

Outputs plaintext value of the .htpasswd file:

```sh
yomateod@proliant:/mnt/c/workspace/docker/docker-alpine-htpasswd$ make run

docker run --rm -it appsoa/docker-alpine-htpasswd:1.0.0 "user" "bu5ZHe1s24+NiECqPAqc7gg7cIy1HiRJxIS1PzGBoq8="

user:$2y$05$oLXPXn9igJ9SsexPZ8MgdO52I9ypJPbwJusepb/ncV.6p1AYj4I2K
```
