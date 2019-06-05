# Config files with installation script

## Prerequisites

```git```, ```zsh```, ```tmux```, ```openssh``` (for ssh support with git),
```python``` (for ultisnips), ```diff-so-fancy``` (for nicer git diffs).

If run as is, the script assumes the user is able to use ssh:// when cloning
git-repos, if this is not the case, either properly generate the ssh-keys, or
remove the line that replaces https:// with ssh:// in .gitconfig and it should
run.

## Installation

Run:

```shell
./install
```

and hope for the best! The script can be modified to ignore vim or zsh by
simply commenting out the calls to setup\*. If all goes well, the dotfiles
should be installed to $HOME, and scripts to $HOME/.scripts (which is in the
PATH in .zshrc).


## Keymap

In Arch, the keymap for proper svdvorak can be loaded by:

```shell
loadkeys dvorak-sv-42.map.gz
```

To make it permanent, copy the file to ```/etc/share/kbd/keymaps/i386/dvorak/```, and add the following to ```/etc/vconsole.conf```:

```
KEYMAP=dvorak-sv-42.map.gz
```

Within X, the layout can be set using:

```
setxkbmap -layout 'se(svdvorak)' -option caps:escape
```

## Restoring terminal settings

```shell
dconf load /org/gnome/terminal/ < Confs/terminal.conf
```

To export the current settings, use:

```shell
dconf dump /org/gnome/terminal/ > Confs/terminal.conf
```

See also:
https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile

## Fonts

Ubuntu Mono derivative Powerline can be found here:
https://github.com/powerline/fonts

## Building a new vim version in Ubuntu

This will install the new vim to /usr/local/bin, which means it will be before
the old vim in /usr/bin in the $PATH.

```shell
sudo apt-get build-dep vim
git clone https://github.com/vim/vim.git

./configure --with-features=huge \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu
make

sudo make install

make clean
make distclean

```
