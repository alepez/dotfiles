#!/bin/sh

STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
    echo -n " "
    nordvpn status | grep Country: | awk '{ print $2 }'
fi
