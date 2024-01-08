## @filename: ~/.zshrc

## oh-my-zsh {{{

## Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

## Path to custom themes/plugins etc...
export ZSH_CUSTOM=~/.dotfiles/more/zsh/oh-my-zsh

## Set name of the theme to load.
## Look in $ZSH/themes/
# ZSH_THEME="pez"

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

## }}}

## Notify

x_notify() {
  notify-send $1
}

## }}}

## tmux {{{
if [ "${ZSH_NO_TMUX}" != "true" ]; then
  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOCONNECT=false
fi

cd() {
    builtin cd $1
    tmux refresh-client -S
}

## }}}

## plugins {{{
## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
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

fpath+=~/.zfunc

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Override `l`
# alias l='exa --color always --oneline'
# alias ll='exa --color always --long --header'
# alias la='exa --color always --long --header --all'

## }}}

## History {{{
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="yyyy-mm-dd"

## append to history
setopt appendhistory

## ignore duplicates
setopt hist_ignore_all_dups
## }}}

## zsh options {{{

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

## }}}

## key bindings {{{
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward
## }}}

## cache {{{

## use this directory for zsh cache. I keep this in RAM (tmpfs)
mkdir -p ~/.cache/zsh
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.cache/zsh
## }}}

## Editor {{{

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  export EDITOR=nvim
else
  export EDITOR=vim
fi

## }}}

## Environment {{{

## Add user's bin directory to path if it exists
if [ -d $HOME/.local/bin ]; then export PATH="$HOME/.local/bin:${PATH}"; fi

## Add user's bin directory to path if it exists
if [ -d $HOME/bin ]; then export PATH="$HOME/bin:${PATH}"; fi

## Add neovim bin directory to path if it exists
if [ -d $HOME/.neovim ]; then export PATH="$HOME/.neovim/bin:${PATH}"; fi

## Enable true color for neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

## }}}

## flow control {{{
stty stop undef
stty start undef
## }}}

## miscellaneus functions

## Find a file in current directory or parents {{{
function findup {
  path=$(pwd)
  while [[ "$path" != "" && ! -e "$path/$1" ]]; do
    path=${path%/*}
  done
  echo "$path/$1"
}
## }}}

## Push my time to a remote machine via ssh {{{
function ssh-time-push {
	datetime=$( date --utc +%m%d%H%M%Y )
	ssh $@ "( date --utc $datetime; /sbin/hwclock --systohc )"
}
## }}}

## Use time from a remote machine to set my local time. {{{
function ssh-time-pull {
	datetime=$( ssh $@ "date --utc +%m%d%H%M%Y" )
	sudo date --utc $datetime; sudo /sbin/hwclock --systohc
}
## }}}

## video to gif
function video2gif {
	local gif="${1%.*}.gif"
	ffmpeg -i ${1} -vf fps=5,scale=640:-1:flags=lanczos,palettegen palette.png
	ffmpeg -i ${1} -i palette.png -filter_complex "fps=5,scale=640:-1:flags=lanczos[x];[x][1:v]paletteuse" ${gif}
}

## Convert markdown to other formats with pandoc {{{
## \param 1 markdown source file path
## \param 2 output format, as file extension (default: pdf)
##
## Creates a new file, with the same name as the source and the output extension
function doconv {
	local out="$( basename "${1}" .md ).${2:=pdf}";
	pandoc -f markdown -s -o "${out}" $1 && xdg-open "${out}";
}
## }}}

## switch from console to vim {{{
## http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
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

## Wordreference
function wr { xdg-open http://wordreference.com/$1/$2 &>/dev/null }

## Syntax highlight a file using bat and copy as rich text to the clipboard
function bat2clip {
  bat --theme=OneHalfLight --color=always "${1}" \
    | aha \
    | xclip -t text/html -selection clipboard;
}

## }}}

## fzf https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
## Set ag, the silver searcher, as the default command, so it can skip files in
## ~/.agignore
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

###############################################################################
## Source local configurations
if [ -e ~/.zshrc.local ]; then source ~/.zshrc.local; fi

# vim:foldmethod=marker:foldlevel=0

################################################################################
## startship
eval "$(starship init zsh)"
alias putane="netstat -putane"
