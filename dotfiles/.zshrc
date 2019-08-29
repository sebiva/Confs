# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jonathan"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh

source ${HOME}/.zshrc_base

###############################################################################
### User configuration
###############################################################################

export PATH=$(echo "
$HOME/bin:
$HOME/.local/bin:
$HOME/opt:
/usr/local/sbin:
/usr/local/bin:
/usr/bin:
/bin:
$HOME/.scripts:
" | paste -sd "" -)

# Emacs mode
bindkey -e

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. For a full list of active aliases, run `alias`.

## GHCI memory limit
alias ghci_m="ghci +RTS -M2048m"
## Vim fixes
alias v="TERM=xterm vim"
alias vrc="TERM=xterm vim ~/.vimrc"
alias vcheat="TERM=xterm vim ~/.vcheat"

# Others
alias cp='cp -iv'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod="chmod -c"
alias chown="chown -c"

if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias ll='ls -l'

# Awaken tilde from the dead:
xmodmap -e 'keycode 35 = diaeresis asciicircum diaeresis asciicircum asciitilde caron asciitilde caron bracketright braceright'
