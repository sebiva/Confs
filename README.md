# Config files with installation script

## Prerequisites

```git```, ```zsh```, ```tmux```, ```openssh``` (for ssh support with git),
```python``` (for ultisnips), ```silversearcher-ag``` (for git-grepper in vim),
```xdotool''' (for easier pasting in i3).

If run as is, the script assumes the user is able to use ssh:// when cloning
git-repos, if this is not the case, either properly generate the ssh-keys, or
remove the line that replaces https:// with ssh:// in .gitconfig and it should
run.

## Installation

Run:

```shell
./install all
```

and hope for the best! The script can be run with the arguments:
```all | zsh | vim | tmux | scripts | dotfiles``` to change what parts are to
be installed.  If all goes well, the dotfiles should be installed to $HOME, and
scripts to $HOME/.scripts (which is in the PATH in .zshrc).

## Vim adaptations

To get certain erlang repositories working (mixing rebar2 and rebar3), the
'vim-erlang-compiler.path' file must be applied to the plugin in
~/.vim/bundle/vim-erlang-compiler after vim has been installed.

Snippets:
.vim/bundle/vim-snippets/UltiSnips/erlang.snippets

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

To set keyrepeat:

```
set r rate 200 50
```

These settings can be added to .profile to have them run automatically.

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
sudo apt build-dep vim
git clone https://github.com/vim/vim.git

./configure --with-features=huge \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu
make

sudo make install

make clean
make distclean

```
