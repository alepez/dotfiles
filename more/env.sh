# This script can be sourced by bash and zsh to set environment variables

if [ -z "${DOTFILES_ENV_SET}" ]; then
  export DOTFILES_ENV_SET=1

  # TODO Why is this needed now? I'm sure this wasn't needed before 479ee15. May be a bug in systemd, lightdm or dbus
  export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

  export EDITOR='nvim'

  # Add user's bin directory to path if it exists
  if [ -d $HOME/.local/bin ]; then
    export PATH="$HOME/.local/bin:${PATH}";
  fi

  # Add cargo bin directory to path if it exists
  if [ -d $HOME/.cargo/bin ]; then
    export PATH="$HOME/.cargo/bin:${PATH}";
  fi

  # Also source private env file if it exists
  if [ -e ~/.dotfiles-private/env.sh ]; then
    source ~/.dotfiles-private/env.sh 
  fi
fi
