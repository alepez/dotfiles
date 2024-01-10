## @filename: ~/.zshenv

# This file is read and executed for every shell session, whether it is
# interactive or not. It is used for setting global environment variables that
# should be available to all shell sessions. This file is often used to set
# important system-wide variables like PATH, which determines the directories
# where the shell looks for executable files.

# TODO Why is this needed now? I'm sure this wasn't needed before 479ee15. May be a bug in systemd, lightdm or dbus
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

export EDITOR='nvim'

# Add user's bin directory to path if it exists
if [ -d $HOME/.local/bin ]; then export PATH="$HOME/.local/bin:${PATH}"; fi

###############################################################################
## Source local configurations
if [ -e ~/.zshenv.local ]; then source ~/.zshenv.local; fi

