## @filename: ~/.zshenv

# TODO Why is this needed now? I'm sure this wasn't needed before 479ee15. May be a bug in systemd, lightdm or dbus
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

################################################################################
## alias {{{

export EDITOR='nvim'

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

# Create new tmp directory and cd into it
# Dir name is current UTC time, without special characters as : to be
# compatible with PATH env var (so you can add this tmp directory to PATH)
# If first argument is defined, it is used as a suffix
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

# Generate strong password and copy to clipboard
genpassword() {
  file=$( mktemp );
  pwgen --capitalize --numerals --ambiguous --symbols 16 1 -1 > "${file}";
  xclip -i < "${file}";
  xclip -i -selection clipboard "${file}";
  cat "${file}";
  rm "${file}";
  notify-send "Password copied to clipboard";
}

alias CLIP='xclip -i -selection clipboard'

# Shortcut for my favorite editor
alias v="${EDITOR}"
alias sv="sudo ${EDITOR}"

# Filesystem usage, human readable
alias df='df -h'
alias du='du -sh'

# neomutt instead of mutt
alias mutt="neomutt"
alias E="neomutt"

# exa instead of classi ls
lslast() { exa --sort=newest --reverse --color always $@ | head ; }

# Brutally kill
alias ka9='killall -9'
alias k9='kill -9'

# sudo last command
alias fuck='sudo $(fc -ln -1)'

# Highlight
highlight() { grep --color -E "$1|\$"; }

# Grep without buffer
alias nbgrep='stdbuf -o0 -oL grep'

alias nb='stdbuf -i0 -o0 -e0'

# I don't use dc, and sometime i mispell cd
alias dc='cd'

# Disable screensaver and screen energy saving (e.g.: during a speech)
alias noscreensaver='xset -dpms s off'

# Show a notification
ding() {
  (
  notify-send -u low '!'
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga
  ) >/dev/null 2>/dev/null </dev/null &
}

## Docker {{{

## I use docker so often I need this
alias dk="docker"
alias dkps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\""
alias dklog='docker logs --tail 10 -f'

## A better docker stat
## Thanks to rbravo-avantrip
## https://github.com/docker/docker/issues/20973#issuecomment-245036858
dkstats() {
  while true; do
    TEXT=$(docker stats --no-stream $(docker ps --format={{.Names}}));
    sleep 0.5;
    clear;
    echo "$TEXT";
  done
}

# Rebuild and restart a single container with docker-compose
# or just do not specify the container name and all containers in the docker-compose
# file will be rebuilded and restarted.
dkup() {
  docker-compose build ${1} && \
    docker-compose stop ${1} && \
    docker-compose up -d --no-deps ${1}
}

## }}}

## NodeJS {{{

# Pre-setup nvm

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

## }}}

################################################################################
## Git Aliases {{{
## See ~/.gitconfig
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

## Commit, message as arguments, quotes not needed
gcm() { git commit -m "$*" }

## Clean all untracked files
git-superclean() { read -q "REPLY?Sure? "; if [ "${REPLY}" = 'y' ]; then echo && git reset --hard && git clean -ffdx; fi }

## Difference with commond ancestor
git-diffanc() {
  local main_branch;
  test -n "${2}" && main_branch="${2}" || main_branch="$( git rev-parse --abbrev-ref HEAD )"
  git diff $( git merge-base "${1}" "${main_branch}" ) "${1}"
}

## Update recursively all submodules
git-subsync() {
  git submodule sync --recursive && git submodule update --recursive --remote
}

## Git pull, also submodules
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

## }}}

################################################################################
## rsync ssh tunnel with ControlPath {{{
## see: http://unix.stackexchange.com/a/50515/12662
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
## }}}

################################################################################
## SSH {{{
alias sshpubkey="ssh-add -L |  head -1 | xclip"

sshconf() {
  local args='';
  if [ -n "${1}" ]; then args="-c /Host ${1}"; fi
  ${EDITOR} ${HOME}/.ssh/config ${args}
}
## }}}

## scaling governor {{{
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
## }}}

## backup {{{
backup_tar() { tar cpvf "${1}~$( date +%Y%m%d-%H%M%S ).tar" "${1}"; }
backup_zip() { zip -r "${1}~$( date +%Y%m%d-%H%M%S ).zip" "${1}"; }
backup_cp() { cp -a "${1}" "${1}~$( date +%Y%m%d-%H%M%S )~"; }
backup_mv() { mv "${1}" "${1}~$( date +%Y%m%d-%H%M%S )~"; }
zipr() { zip "${1}.zip" "${1}" -r; }
## }}}

################################################################################
## minecraft {{{
minecraft-backup() {
  local root_dir="${HOME}/.minecraft"
  local src_dir="saves"
  local dir="${HOME}/.minecraft-backup"
  local archive_dir="${HOME}/.minecraft-backup"
  local archive="${archive_dir}/$( date +%Y%m%d-%H%M%S ).tar"
  echo "Saving to ${archive}"
  cd ${root_dir} && tar cpvf ${archive} ${src_dir} && ls -lh ${archive}
}
## }}}

###############################################################################
## Source local configurations
if [ -e ~/.zshenv.local ]; then source ~/.zshenv.local; fi
