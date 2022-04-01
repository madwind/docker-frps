#! /bin/sh
#
# entrypoint.sh

set -e

cd /frpc

if [ ! -f /config/frps.ini ]; then
  cp /frps/frps.ini /config/
  fi

./frpc -c /config/frps.ini
