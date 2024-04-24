#!/usr/bin/env bash

# Note: this file is sourced by betterlockscreen, not executed

# This is necessary to revert changes made by custom-pre.sh
xset dpms "${DEFAULT_TIMEOUT}" "${DEFAULT_TIMEOUT}" "${DEFAULT_TIMEOUT}"
