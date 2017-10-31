# dotfiles

Unix, Linux, and macOS configuration files.

# Comments

I commonly use the following nix tools:
- tmux
- minicom
- zsh
- emacs
- vim


And just like many on github, I drag these files pretty much everywhere I login.
Heck, the USB fob on my set of keys has most of these, might at well post them
somewhere else where others can use them too. Nothing too fancy, and as always,
they are tweaked where every I go.


# Usage

## Install

```sh
mkdir -p ${HOME}/Workspace && git clone https://github.com/npotts/dotfiles ~/Workspace/dotfiles
cd ${HOME}/Workspace/dotfiles && DOTFILES=`pwd` ./install
```

## Adding Directories

Plain directories read **dir** in the root of the repo are picked up by
the ```install``` script and symlinked to **${HOME}/.dir**.


## Adding files

Plain files are ignored unlesss they end in ".rc", in which case, they were
symlinked to **${HOME}/.${file/.rc/}**.  
