#!/bin/sh

if ( systemctl status nordvpnsd.service | grep inactive >/dev/null 2>/dev/null ); then
  echo
  exit 0
fi

STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
  echo -n " "
  nordvpn status | grep Country: | awk '{ print $2 }'
else
  echo
fi
