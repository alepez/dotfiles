# Alessandro Pezzato dotfiles

## Setup

Clone this repository in `~/.dotfiles` (in your home directory).

```sh
git clone https://github.com/alepez/dotfiles.git ~/.dotfiles
```

Link what you need from `home` to your home directory.

Example:

```sh
ln -nfs ~/.dotfiles/home/.zshrc ~/.zshrc
```

## Check consistency

This command should print a list of tracked configurations files and the linked
file in home directory, if it exists.

```sh
./check
```


