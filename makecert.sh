#!/bin/sh

set -eu pipefail

openssl req -newkey rsa:4096 \
  -x509 \
  -sha256 \
  -days 3650 \
  -nodes \
  -out config/grafana.pem \
  -keyout config/grafana.key \
&& chown 472:472 config/grafana.key \
&& chown 472:472 config/grafana.pem
