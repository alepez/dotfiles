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

# fzf https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set ag, the silver searcher, as the default command, so it can skip files in
# ~/.agignore
export FZF_DEFAULT_COMMAND='ag -g ""'

# Autocompletion
compinit

# Remember last working directory
cd() {
  builtin cd "$@";
  tmux refresh-client -S
  echo "${PWD}" > ~/.cache/cwd
}

export cd

alias cwd='cd $( cat ~/.cache/cwd )'

# Create directory and cd into it
D() { mkdir -p $1 && cd $1 }

# Go to workspace
alias W='cd ~/workspace'

# Open file with default application
alias O='xdg-open'

# Start editing dotfiles
alias dot='cd ~/.dotfiles && vim'

# time and date
alias today='date +%Y-%m-%d --utc | tr -d \\n'
alias now='date +%Y-%m-%dT%H-%M-%S --utc | tr -d \\n'

alias add_timestamp='while read line; do echo "$(date +%Y-%m-%dT%H:%M:%S.$( date +%N | sed 's/......$//' ) --utc) $line"; done'

alias pi='echo 3.14159265359'

alias leave='sleep 10 && exit'

# Dir name is current UTC time, without special characters as : to be
# compatible with PATH env var (so you can add this tmp directory to PATH)
# If first argument is defined, it is used as a suffix
# Note: this must be a function: it changes dir in the current shell
DD() {
  date="$( date +%Y%m%dT%H%M%S --utc | tr -d \\n )"
  p="${HOME}/tmp/${date}"
  if [ -n "${1}" ]; then
    p="${p}-${1}"
  fi
  mkdir "${p}"
  cd "${p}"
}

# Change directory to last created directory in tmp
alias last_tmp='cd ~/tmp/$( ls -t ~/tmp | head -1 )'

alias CLIP='xclip -i -selection clipboard'

# Shortcut for my favorite editor
alias v="${EDITOR}"
alias sv="sudo ${EDITOR}"

# Filesystem usage, human readable
alias df='df -h'
alias du='du -sh'

# Brutally kill
alias ka9='killall -9'
alias k9='kill -9'

# sudo last command
alias fuck='sudo $(fc -ln -1)'

# Highlight
highlight() { grep --color -E "$1|\$"; }

# Grep without buffer
alias nbgrep='stdbuf -o0 -oL grep'

# Disable buffering
alias nb='stdbuf -i0 -o0 -e0'

# I don't use dc, and sometime i mispell cd
alias dc='cd'

# Disable screensaver and screen energy saving (e.g.: during a speech)
alias noscreensaver='xset -dpms s off'

# I often need a python shell for quick math and stuff
alias py="python"

# I use docker so often I need this
alias dk="docker"
alias dkps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\""
alias dklog='docker logs --tail 10 -f'

# Node Version Manager
# Note: this must be a function: it changes the current shell environment
nvm() {
  if [ -e /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
    # Once sourced, nvm is overridden
    # This is not recursive, because at this point nvm is no more this function.
    nvm $@
  else
    echo "nvm not found"
  fi
}

alias npmi="npm install --save"
alias npmid="npm install --save-dev"

################################################################################
# Git Aliases
# See ~/.gitconfig
alias ga='git add'            # Add files to the index
alias gap='git add --patch'   # Chunk by chunk
alias gA='git add -A'         # Add all files, remove from index deleted files
alias grv='git remote -v'     # show all Remotes Verbosely
alias gl='git l'            # log --graph --date=short
alias gdh='git diff HEAD'     # show all changes from Head
alias gdu='gd'                # show Unstaged changes
alias gdc='git dc'            # show Unstaged changes
alias gds='git diff --stat' # show Staged changes
alias gpl='git pull'          # Pull
alias gpll='git pull --recurse-submodules --jobs=10'
alias gps='git push'          # Push
alias gnb='git nb'            # New Branch aka checkout -b
alias gco='git co'            # Checkout
alias gamend='git commit --amend'
alias gh='git show'
alias gd='git diff'
alias gs='git status'
alias gll='git ll'

# Quick merge from origin/master, no fast forward
gqm() { if [ -z "${1}" ]; then git status -bs; echo -e "\nbranch?"; return; fi; git fetch ; git merge origin/${1} --no-ff }

# Commit, message as arguments, quotes not needed
gcm() { git commit -m "$*" }

# Clean all untracked files
git-superclean() { read -q "REPLY?Sure? "; if [ "${REPLY}" = 'y' ]; then echo && git reset --hard && git clean -ffdx; fi }

# Difference with commond ancestor
git-diffanc() {
  local main_branch;
  test -n "${2}" && main_branch="${2}" || main_branch="$( git rev-parse --abbrev-ref HEAD )"
  git diff $( git merge-base "${1}" "${main_branch}" ) "${1}"
}

# Update recursively all submodules
git-subsync() {
  git submodule sync --recursive && git submodule update --recursive --remote
}

# Git pull, also submodules
gPL() {
  git pull "$@" &&
    git submodule sync --recursive &&
    git submodule update --init --recursive
}

git-huge-finder() {
  git rev-list --objects --all \
    | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
    | sed -n 's/^blob //p' \
    | sort --numeric-sort --key=2 \
    | cut -c 1-12,41- \
    | numfmt --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
}

################################################################################
# cargo aliases

alias ca="cargo"
alias cab="cargo build"
alias cac="cargo check"
alias car="cargo run"
alias caw="cargo watch -c -x check"
alias cact="cargo watch -c -x check -x test"
alias cawtr="cargo watch -c -x check -x test -x run"
alias cawr="cargo watch -c -x check -x run"
alias cawb="cargo watch -c -x check -x build"

################################################################################
# rsync ssh tunnel with ControlPath
# see: http://unix.stackexchange.com/a/50515/12662
ssh-rsync-fast-start() {
  mkdir -p ~/.ssh/ctl
  ssh -nNf -o ControlMaster=yes -o ControlPath="$HOME/.ssh/ctl/%L-%r@%h:%p" $@
}

ssh-rsync-fast() {
  rsync -e "ssh -o 'ControlPath=$HOME/.ssh/ctl/%L-%r@%h:%p'" $@
}

ssh-rsync-fast-stop() {
  ssh -O exit -o ControlPath="$HOME/.ssh/ctl/%L-%r@%h:%p" $@
}

################################################################################
# SSH
alias sshpubkey="ssh-add -L |  head -1 | xclip"

sshconf() {
  local args='';
  if [ -n "${1}" ]; then args="-c /Host ${1}"; fi
  ${EDITOR} ${HOME}/.ssh/config ${args}
}

# scaling governor
governor() {
  if [  -n "${1}" ]; then
    for c in $(ls -d /sys/devices/system/cpu/cpu[0-9]*); do
      echo "${1}" | sudo tee $c/cpufreq/scaling_governor > /dev/null
    done
  else
    echo "Available governors:"
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
  fi
}

# backup
backup_tar() { tar cpvf "${1}~$( date +%Y%m%d-%H%M%S ).tar" "${1}"; }
backup_zip() { zip -r "${1}~$( date +%Y%m%d-%H%M%S ).zip" "${1}"; }
backup_cp() { cp -a "${1}" "${1}~$( date +%Y%m%d-%H%M%S )~"; }
backup_mv() { mv "${1}" "${1}~$( date +%Y%m%d-%H%M%S )~"; }
zipr() { zip "${1}.zip" "${1}" -r; }

alias history="fc -il -t'%F %T' 1"

# the most used (pun not intended) netstat configuration
alias putane="netstat -putane"

###############################################################################
# Source local configurations
if [ -e ~/.zshrc.local ]; then source ~/.zshrc.local; fi

################################################################################
# start starship
eval "$(starship init zsh)"

# Remove unwanted aliases from plugins
unalias duf

# vim:foldmethod=marker:foldlevel=0
