## @filename: ~/.zshenv

# speed up
skip_global_compinit=1

################################################################################
## alias {{{

alias bowi="bower install --save"
alias npmi="npm install --save"
alias automocha="supervisor -q -n exit -x mocha -- -b --recursive"

function D { mkdir -p $1 && cd $1 }
alias W='cd ~/workspace'
alias O='xdg-open'

# Useful for remote hosts with tmux, open a new terminal window with its own
# tmux session. Understand which terminal emulator is currently in use.
if [ "${COLORTERM}" = "gnome-terminal" ]; then
  alias S="gnome-terminal -x ssh"
else
  alias S="konsole -e ssh"
fi

alias stt='subl3 -n .'
alias st='subl3'
alias v='vim'

alias df='df -h'
alias du='du -sh'
alias lsg='ll | grep'
alias ka9='killall -9'
alias k9='kill -9'

alias nvminit='[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh'
alias kiexinit='test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex" && kiex use 1.2.3'

function svndiff {
  svn diff $@ | colordiff | less
}

## I don't use dc, and somtime i mispell cd
alias dc='cd'

## fuzzy find password with `pass` password manager
## See
## - http://www.passwordstore.org/
## - https://github.com/junegunn/fzf
function Pass { local passpath=$( cd ~/.password-store && git ls-files | grep -v "^\." | fzf-tmux | sed "s/\.gpg$//" ); pass -c "${passpath}"; pass "${passpath}"; }

## }}}

################################################################################
## Git Aliases {{{
## See ~/.gitconfig
alias gs='git status'         # show Status
alias ga='git add'            # Add files to the index
alias gA='git add -A'         # Add all files, remove from index deleted files
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

# Quick merge from origin/master, no fast forward
function gqm { if [ -z "${1}" ]; then git status -bs; echo -e "\nbranch?"; return; fi; git fetch ; git merge origin/${1} --no-ff }

## Commit, message as arguments, quotes not needed
function gcm { git commit -m "$*" }

## Add all files, Commit, Message as argument
function gacm { git add -A && git commit -m "$*" }
alias gcam="gacm" # Correct mistyping
alias gg="gacm" # I do this so many times a need a shortcut

## Add all files, Commit, use editor for message
function gac { git add -A && git commit }

## Add all files, Commit, Message as argument, then Push
function gacmps { git add -A && git commit -m "$*" && git push }
alias ggo="gacmps" # Go! shortcut for gacmps

## }}}

################################################################################
## Svn Aliases {{{
alias sst='svn status'
alias sa='svn add'
alias sd='svndiff'
function scm { svn commit -m "$*" }
function slog { svn log $@ | less }
## }}}

###############################################################################
## Source local configurations
if [ -e ~/.zshenv.local ]; then source ~/.zshenv.local; fi

