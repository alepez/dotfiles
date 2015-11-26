## @filename: ~/.zshrc
## Path to your oh-my-zsh installation.
export ZSH=/opt/oh-my-zsh

## Path to custom themes/plugins etc...
export ZSH_CUSTOM=~/.oh-my-zsh/custom

# Set name of the theme to load.
# Look in $ZSH/themes/
ZSH_THEME="pez"

## Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

## Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

## Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

## Uncomment the following line to disable command auto-correction.
DISABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

## disable marking untracked files under VCS as dirty. This makes repository
## status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(common-aliases dirhistory web-search tmux)

source $ZSH/oh-my-zsh.sh

## Path

################################################################################
## History
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="yyyy-mm-dd"

## append to history
setopt appendhistory

## ignore duplicates
setopt hist_ignore_all_dups


################################################################################
## zsh options

## cd to directory without writing cd
setopt autocd

## put a # in front of line and it is ignored. Useful when you want to write
## a command, but execute it later
setopt interactivecomments

## background jobs will be left alone
setopt no_hup

## disable beep
unsetopt beep

## disable extended glob
unsetopt extendedglob

################################################################################
## ssh agent
eval $( easy-ssh-agent start --env 2>/dev/null ) 2>/dev/null

################################################################################
## key bindings
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward

################################################################################
## cache

## use this directory for zsh cache. I keep this in RAM (tmpfs)
mkdir -p ~/.cache/zsh
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.cache/zsh

################################################################################
## alias

alias bowi="bower install --save"
alias npmi="npm install --save"
alias automocha="supervisor -q -n exit -x mocha -- -b --recursive"

alias M="mkdir"
alias W='cd ~/workspace'

alias stt='subl3 -n .'
alias st='subl3'

alias df='df -h'
alias du='du -h -d 2'
alias lsg='ll | grep'
alias ka9='killall -9'
alias k9='kill -9'

alias nvminit='[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh'
alias svndiff='svn diff | colordiff | less'

## FIXME go to zshrc.local
alias tt='st ~/workspace/gestione/data/timetracker/$( date +%Y-%m ).yml'

## I don't use dc, and somtime i mispell cd
alias dc='cd'

################################################################################
## Git Aliases
## See ~/.gitconfig
alias gs='git status'         # show Status
alias gcm='git commit -m'     # Commit, Message as argument
alias ga='git add -A'         # Add all files, remove from index delete files
alias grv='git remote -v'     # show all Remotes Verbosely
alias glog='git l'            # log --graph --date=short
alias gl='glog'               # shortcut to glog
alias gdh='git diff HEAD'     # show all changes from Head
alias gd='gdh'                # shortcut to `gdh`
alias gdu='gd'                # show Unstaged changes
alias gds='git diff --cached' # show Staged changes
alias gpl='git pull'          # Pull
alias gps='git push'          # Push
alias gnb='git nb'            # New Branch aka checkout -b
alias gco='git co'            # Checkout

## Add all files, Commit, Message as argument
function gacm { git add -A && git commit -m "$*" }
alias gcam="gacm" # Correct mistyping
alias gg="gacm" # I do this so many times a need a shortcut

## Add all files, Commit, use editor for message
function gac { git add -A && git commit }

## Add all files, Commit, Message as argument, then Push
function gacmps { git add -A && git commit -m "$*" && git push }
alias ggo="gacmps" # Go! shortcut for gacmps

################################################################################
## Svn Aliases
alias sst='svn status'
alias sci='svn commit'
alias sa='svn add'
alias slog='svn log | less'
alias sd='svndiff'

################################################################################
## Environment

export EDITOR=/usr/bin/vim

## Add user's bin directory to path if it exists
if [ -d $HOME/bin ]; then export PATH="$HOME/bin:${PATH}"; fi

###############################################################################
## miscellaneus functions

## Find a file in current directory or parents
function findup {
  path=$(pwd)
  while [[ "$path" != "" && ! -e "$path/$1" ]]; do
    path=${path%/*}
  done
  echo "$path/$1"
}

## Push my time to a remote machine via ssh
function ssh-time-push {
	datetime=$( date --utc +%m%d%H%M%Y )
	ssh $@ "( date --utc $datetime; /sbin/hwclock --systohc )"
}

## Use time from a remote machine to set my local time.
function ssh-time-pull {
	datetime=$( ssh $@ "date --utc +%m%d%H%M%Y" )
	sudo date --utc $datetime; sudo /sbin/hwclock --systohc
}
function screencast {
	ffmpeg -video_size $1 -framerate 25 -f x11grab -i :0.0+$2 \
		~/screencast-$( date +%Y%m%d-%H%M%S ).mp4
}

## http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
## switch from console to vim
function fancy_ctrl_z {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER=" fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy_ctrl_z
bindkey '^Z' fancy_ctrl_z

###############################################################################
## Source local configurations
if [ -e ~/.zshrc.local ]; then source ~/.zshrc.local; fi

