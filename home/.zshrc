# @filename: ~/.zshrc

# This file is read and executed every time a new interactive shell session is
# started. It is typically used for defining aliases, setting environment
# variables, and configuring shell options specific to the user's preferences.
# It is a good place to put customizations that are specific to a particular
# user or machine.

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

# Path to custom themes/plugins etc...
export ZSH_CUSTOM=~/.dotfiles/more/zsh/oh-my-zsh

# Use case-sensitive completion.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#case_sensitive
CASE_SENSITIVE="true"

# Disable bi-weekly auto-update checks.
# TODO DEPRECATED https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#update-settings
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting terminal title.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#automatic-title
DISABLE_AUTO_TITLE="true"

# Disable command auto-correction.
# TODO Still valid? It's here since (at least) 2015. I cannot find a reference.
DISABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#completion_waiting_dots
COMPLETION_WAITING_DOTS="true"

# disable marking untracked files under VCS as dirty. This makes repository
# status check for large repositories much, much faster.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#disable_untracked_files_dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# tmux
if [ "${ZSH_NO_TMUX}" != "true" ]; then
  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOCONNECT=false
fi

# plugins
plugins=(
  archlinux
  rust
  common-aliases
  dirhistory
  docker
  fzf
  history
  pass
  systemd
  tmux
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# History
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

# append to history
setopt appendhistory

# ignore duplicates
setopt hist_ignore_all_dups

# cd to directory without writing cd
setopt autocd

# put a # in front of line and it is ignored. Useful when you want to write
# a command, but execute it later
setopt interactivecomments

# background jobs will be left alone
setopt no_hup

# disable beep
unsetopt beep

# disable extended glob
unsetopt extendedglob

# key bindings
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward

# use this directory for zsh cache
mkdir -p ~/.cache/zsh
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.cache/zsh

# Enable true color for neovim
# TODO Still needed?
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Disable freeze/unfreeze of terminal
# With tmux, there are better ways
stty stop undef
stty start undef

# Autocompletion
compinit

for f in ~/.dotfiles/more/zsh/*; do
  source "${f}"
done

# Source local configurations
if [ -e ~/.zshrc.local ]; then source ~/.zshrc.local; fi

# start starship
eval "$( starship init zsh )"

# Remove unwanted aliases from plugins
unalias duf
