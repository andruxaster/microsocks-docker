#!/bin/sh

set -eu

LISTEN_ADDR="${LISTEN_ADDR:-0.0.0.0}"
LISTEN_PORT="${LISTEN_PORT:-1080}"

if [ -n "${PROXY_USER:-}" ] || [ -n "${PROXY_PASS:-}" ]; then
  : "${PROXY_USER:?Set PROXY_USER}"
  : "${PROXY_PASS:?Set PROXY_PASS}"
  exec microsocks -i "$LISTEN_ADDR" -b 0.0.0.0 -p "$LISTEN_PORT" -u "$PROXY_USER" -P "$PROXY_PASS"
else
  exec microsocks -i "$LISTEN_ADDR" -b 0.0.0.0 -p "$LISTEN_PORT"
fi
