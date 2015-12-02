## @filename: ~/.zshenv

# speed up
skip_global_compinit=1

################################################################################
## alias {{{

alias bowi="bower install --save"
alias npmi="npm install --save"
alias automocha="supervisor -q -n exit -x mocha -- -b --recursive"

alias D="mkdir -p"
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

## fuzzy find password with `pass` password manager
## See
## - http://www.passwordstore.org/
## - https://github.com/junegunn/fzf
function Pass { pass -c $( cd ~/.password-store && git ls-files | grep -v "^\." | fzf-tmux | sed "s/\.gpg$//" ) }

## }}}

################################################################################
## Git Aliases {{{
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

## }}}

################################################################################
## Svn Aliases {{{
alias sst='svn status'
alias sci='svn commit'
alias sa='svn add'
alias slog='svn log | less'
alias sd='svndiff'
## }}}

