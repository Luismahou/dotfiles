#!/usr/bin/env bash

ln -sf ~/dev/projects/dotfiles/symlinks/gitconfig ~/.gitconfig
ln -sf ~/dev/projects/dotfiles/symlinks/gitignore ~/.gitignore
ln -sf ~/dev/projects/dotfiles/symlinks/alacritty.yml ~/.alacritty.yml
ln -sf ~/dev/projects/dotfiles/symlinks/custom-zshrc ~/.custom-zshrc
ln -sf ~/dev/projects/dotfiles/symlinks/custom-zpreztorc ~/.custom-zpreztorc
ln -sf ~/dev/projects/dotfiles/symlinks/tmux.conf ~/.tmux.conf
ln -sf ~/dev/projects/dotfiles/symlinks/tmuxinator ~/.config/tmuxinator
ln -sf ~/dev/projects/dotfiles/symlinks/fzf.zsh ~/.fzf.zsh
ln -sf ~/dev/projects/dotfiles/symlinks/bat.conf ~/.bat.conf
mkdir -p ~/.config/nvim
ln -sf ~/dev/projects/dotfiles/symlinks/nvim-init.vim ~/.config/nvim/init.vim
mkdir -p ~/.config/gh
ln -sf ~/dev/projects/dotfiles/symlinks/gh-config.yml ~/.config/gh/config.yml

ln -sf ~/dev/projects/dotfiles/symlinks/ghopen /usr/local/bin/ghopen

# TODO Figure out where to put this:
# # The following fixes zsh completion warning. More info: https://stackoverflow.com/a/63447799
# chmod g-w /usr/local/share/zsh
# chmod g-w /usr/local/share/zsh/site-functions

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
