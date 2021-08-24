#!/bin/sh

set -eu pipefail

cp jsonexporter.template.yml jsonexporter.yml && \
cp grafana.template.ini grafana.ini && \
cp prometheus.template.yml prometheus.yml
