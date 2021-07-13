# Alessandro Pezzato dotfiles

## Setup

Clone this repository in `~/.dotfiles` (in your home directory).

```sh
git clone https://github.com/alepez/dotfiles.git ~/.dotfiles
```

Choose what you need:

```sh
# shell and cli tools
ln -nfs ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -nfs ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -nfs ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -nfs ~/.dotfiles/git/gitignore ~/.gitignore
ln -nfs ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -nfs ~/.dotfiles/ag/agignore ~/.agignore
ln -nfs ~/.dotfiles/gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -nfs ~/.dotfiles/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -nfs ~/.dotfiles/starship/starship.toml ~/.config/starship.toml

# desktop and graphical tools
ln -nfs ~/.dotfiles/xbindkeysrc ~/.xbindkeysrc
ln -nfs ~/.dotfiles/alacritty.yml .alacritty.yml
ln -nfs ~/.dotfiles/i3 ~/.config/i3
ln -nfs ~/.dotfiles/i3/i3blocks.conf ~/.i3blocks.conf
ln -nfs ~/.dotfiles/roxterm.sourceforge.net ~/.config/roxterm.sourceforge.net
ln -nfs ~/.dotfiles/i3/gtkrc-2.0 ~/.gtkrc-2.0
ln -nfs ~/.dotfiles/i3/compton.conf ~/.config/compton.conf
ln -nfs ~/.dotfiles/i3/dunstrc ~/.config/dunst/dunstrc
```
