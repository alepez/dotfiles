# Alessandro Pezzato dotfiles

## Setup

Clone this repository in `~/.dotfiles` (your home directory).

```sh
git clone https://github.com/alepez/dotfiles.git ~/.dotfiles
```

Choose what you need:

```sh
ln -nfs ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -nfs ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -nfs ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -nfs ~/.dotfiles/git/gitignore ~/.gitignore
ln -nfs ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -nfs ~/.dotfiles/ag/agignore ~/.agignore
ln -nfs ~/.dotfiles/i3 ~/.config/i3
ln -nfs ~/.dotfiles/i3/i3blocks.conf ~/.i3blocks.conf
ln -nfs ~/.dotfiles/roxterm.sourceforge.net ~/.config/roxterm.sourceforge.net
ln -nfs ~/.dotfiles/i3/gtkrc-2.0 ~/.gtkrc-2.0
ln -nfs ~/.dotfiles/i3/compton.conf ~/.config/compton.conf
ln -nfs ~/.dotfiles/i3/dunstrc ~/.config/dunst/dunstrc
ln -nfs ~/.dotfiles/gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -nfs ~/.dotfiles/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -nfs ~/.dotfiles/top/toprc ~/.toprc
ln -nfs ~/.dotfiles/xbindkeysrc ~/.xbindkeysrc
ln -nfs ~/.dotfiles/muttrc ~/.muttrc
ln -nfs ~/.dotfiles/coc ~/.config/coc
```

## Dependencies

 - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
 - i3wm
 - dunst
 - oh-my-zsh
