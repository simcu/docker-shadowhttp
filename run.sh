#!/bin/sh
privoxy --no-daemon /etc/privoxy/config &
sslocal "$@"
