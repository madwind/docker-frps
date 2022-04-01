#! /bin/sh
#
# entrypoint.sh

set -e

cd /frps

if [ ! -f /config/frps.ini ]; then
  cp /frps/frps.ini /config/
  fi

./frps -c /config/frps.ini
