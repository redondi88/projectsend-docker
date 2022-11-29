#!/usr/bin/env sh
set -eu

envsubst '${SERVICE_NAME}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
