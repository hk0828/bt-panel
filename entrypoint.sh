#!/bin/bash

set -e

if [ ! -e '/www/server/panel/data/port.pl' ]; then
    cp -a /usr/src/www/* /www/
fi

service bt restart

while true; do
    sleep 1d
done

#exec "$@"