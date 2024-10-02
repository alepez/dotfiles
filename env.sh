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
  if [ -e $HOME/.dotfiles-private/env.sh ]; then
    source $HOME/.dotfiles-private/env.sh
  fi

  # Also source $HOME/.env.local file if it exists
  if [ -e $HOME/.env.local ]; then
    source $HOME/.env.local
  fi

  # SSH Agent
  # Launch only if not already available (already started or forwarded)
  if [ -z "${SSH_AUTH_SOCK}" ]; then
    # Use gpg agent only if private keys are available and gpgconf is installed
    # https://wiki.archlinux.org/title/GnuPG#Set_SSH_AUTH_SOCK
    # Launch gpg-agent SSH_AUTH_SOCK only if is not set, to avoid conflicts with
    # ssh-agent.
    if which gpgconf >/dev/null && ls ${HOME}/.gnupg/private-keys-v1.d/*; then
      unset SSH_AGENT_PID
      if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
        export SSH_AUTH_SOCK="$( gpgconf --list-dirs agent-ssh-socket )"
      fi
    elif which ssh-agent >/dev/null; then
      # This will run a ssh-agent process if there is not one already, and save
      # the output thereof. If there is one running already, we retrieve the
      # cached ssh-agent output and evaluate it which will set the necessary
      # environment variables.
      # See https://wiki.archlinux.org/title/SSH_keys
      if ! pgrep -u "$USER" ssh-agent > /dev/null; then
          ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
      fi
      if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
          source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
      fi
    fi
  fi

  # Always use the adapter that uses the least possible power.
  # This is often an integrated GPU.
  # https://docs.rs/wgpu/latest/wgpu/
  # Added for bevy
  export WGPU_POWER_PREF=low

  # Prevent pip or poetry trying to access a keyring
  export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
fi
