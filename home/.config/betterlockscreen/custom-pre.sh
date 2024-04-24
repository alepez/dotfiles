#!/usr/bin/env bash

# Note: this file is sourced by betterlockscreen, not executed

# Fix an issue with betterlockscreen, where the screen would not switch to
# standby mode after locking. It is probably due to the fact that there are
# three different timeout values for standby, suspend and off modes, and
# betterlockscreen just overrides the first one.
xset dpms "${lock_timeout}" "${lock_timeout}" "${lock_timeout}"
