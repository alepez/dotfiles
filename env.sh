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

  # Always use the adapter that uses the least possible power.
  # This is often an integrated GPU.
  # https://docs.rs/wgpu/latest/wgpu/
  # Added for bevy
  export WGPU_POWER_PREF=low

  # Prevent pip or poetry trying to access a keyring
  export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
fi

# This needs ssh-agent.service to be enabled
# See https://wiki.archlinux.org/title/SSH_keys
if [ -e "$XDG_RUNTIME_DIR/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
