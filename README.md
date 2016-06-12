# Config files with installation script

## Prerequisites

```git```, ```zsh```, ```tmux```, ```openssh``` (for ssh support with git), ```python``` (for ultisnips)

If run as is, the script assumes the user is able to use ssh:// when cloning git-repos, if this is not the case, either properly generate the ssh-keys, or remove the line that replaces https:// with ssh:// in .gitconfig and it should run.

## Installation

Run:

```shell
./install
```

and hope for the best!


## Keymap

In Arch, the keymap for proper svdvorak can be loaded by:

```shell
loadkeys dvorak-sv-42.map.gz
```

To make it permanent, copy the file to ```/etc/share/kbd/keymaps/i386/dvorak/```, and add the following to ```/etc/vconsole.conf```:

```
KEYMAP=dvorak-sv-42.map.gz
```
