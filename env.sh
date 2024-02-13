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

  # SSH Agent
  # https://wiki.archlinux.org/title/GnuPG#Set_SSH_AUTH_SOCK
  # Launch gpg-agent SSH_AUTH_SOCK only if is not set, to avoid conflicts with
  # ssh-agent.
  if [ -z "${SSH_AUTH_SOCK}" ]; then
    unset SSH_AGENT_PID
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
      export SSH_AUTH_SOCK="$( gpgconf --list-dirs agent-ssh-socket )"
    fi
  fi
fi
