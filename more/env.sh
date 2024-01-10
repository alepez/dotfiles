export ALEPEZ=ALEPEZ
export PATH=/home/${USER}/bin:/home/${USER}/.local/bin:/usr/local/bin:/usr/bin:/bin

# TODO Why is this needed now? I'm sure this wasn't needed before 479ee15. May be a bug in systemd, lightdm or dbus
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

export EDITOR='nvim'

# Add user's bin directory to path if it exists
if [ -d $HOME/.local/bin ]; then
  export PATH="$HOME/.local/bin:${PATH}";
fi
