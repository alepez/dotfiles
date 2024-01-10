## @filename: ~/.zshenv

# This file is read and executed for every shell session, whether it is
# interactive or not. It is used for setting global environment variables that
# should be available to all shell sessions. This file is often used to set
# important system-wide variables like PATH, which determines the directories
# where the shell looks for executable files.

. $HOME/.dotfiles/env.sh

###############################################################################
## Source local configurations
if [ -e ~/.zshenv.local ]; then source ~/.zshenv.local; fi

