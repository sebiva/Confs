# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jonathan"
#source /home/or3x/tmp/ingenkopaisen/env/bin/activate
#/home/or3x/tmp/ingenkopaisen/run.py
#deactivate

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$HOME/bin:$HOME/opt:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/Documents/Scripts:$HOME/.cabal/bin/:$HOME/.gem/ruby/2.3.0/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
fi
#else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#
# # From old .zshrc

## GHCI memory limit
alias ghci_m="ghci +RTS -M2048m"

## Vim fixes
alias v="TERM=xterm vim"
#alias vim="TERM=xterm vim"
alias vrc="TERM=xterm vim ~/.vimrc"
alias vcheat="TERM=xterm vim ~/.vcheat"


# Vim mode, get back some ctrl - shortcuts
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^d' delete-char
bindkey '^f' forward-char
bindkey '^b' backward-char

export KEYTIMEOUT=1 # For the ESC delay





### OLD FILE ###############################################################################################
## .zshrc
# Author: Piotr Karbowski <piotr.karbowski@gmail.com>
# License: beerware.

# Basic zsh config.
umask 022
ZDOTDIR=${ZDOTDIR:-${HOME}}
ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"
export EDITOR="/usr/bin/vim"
export TMP="$HOME/tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"

if [ ! -d "${TMP}" ]; then mkdir "${TMP}"; fi

if ! [[ "${PATH}" =~ "^${HOME}/bin" ]]; then
export PATH="${HOME}/bin:${PATH}:${HOME}/Documents/Scripts"
# Cabal
export PATH=$PATH:/home/or3x/.cabal/bin/
fi

# Not all servers have terminfo for rxvt-256color. :<
#if [ "${TERM}" = 'rxvt-256color' ] && ! [ -f '/usr/share/terminfo/r/rxvt-256color' ] && ! [ -f '/lib/terminfo/r/rxvt-256color' ] && ! [ -f "${HOME}/.terminfo/r/rxvt-256color" ]; then
#export TERM='rxvt-unicode'
#fi

## Lista för färger: for code in {000..255}; do print -P -- "$code: %F{$code}TEST%f %K{$code}                 %k"; done
#cred='001'
#cblue='021'
#cgreen='028'
#cyellow='004'
#cmagenta='165'
#ccyan='042'
#corange='214'
#cbrown='130'
#cdarkblue='017'
#cpurple='005'
#cdarkyellow='142'
#cbrightblue='027'
#cblack='016'
#cwhite='231'


# Colors.
#red='\e[0;31m'
#RED='\e[1;31m'
#green='\e[0;32m'
#GREEN='\e[1;32m'
#yellow='\e[0;33m'
#YELLOW='\e[1;33m'
#blue='\e[0;34m'
#BLUE='\e[1;34m'
#purple='\e[0;35m'
#PURPLE='\e[1;35m'
#cyan='\e[0;36m'
#CYAN='\e[1;36m'
#NC='\e[0m'

# Fixa auto cd
setopt auto_cd

# Functions
if [ -f '/etc/profile.d/prll.sh' ]; then
. "/etc/profile.d/prll.sh"
fi


escape_string() {
# Uber useful when you need to translate weird as fuck path into single-argument string.
local escape_string_input
echo -n "String to escape: "
read escape_string_input
_escaped_string="$(printf '%q' "$escape_string_input")"
if [ "$1" = '-o' ]; then
echo
echo "${_escaped_string}"
echo
else
export _escaped_string
echo "Escaped string has been pushed to \${_escaped_string} variable." 1>&2
fi
}

confirm() {
local answer
echo -ne "zsh: sure you want to run '${YELLOW}$@${NC}' [yN]? "
read -q answer
echo
if [[ "${answer}" =~ ^[Yy]$ ]]; then
command "${=1}" "${=@:2}"
else
return 1
fi
}

confirm_wrapper() {
if [ "$1" = '--root' ]; then
local as_root='true'
shift
fi

local runcommand="$1"; shift

if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
runcommand="sudo ${runcommand}"
fi
confirm "${runcommand}" "$@"
}

poweroff() { confirm_wrapper --root $0 "$@"; }
reboot() { confirm_wrapper --root $0 "$@"; }
hibernate() { confirm_wrapper --root $0 "$@"; }

detox() {
if [ "$#" -ge 1 ]; then
confirm detox "$@"
else
command detox "$@"
fi
}

has() {
local string="${1}"
shift
local element=''
for element in "$@"; do
if [ "${string}" = "${element}" ]; then
return 0
fi
done
return 1
}

begin_with() {
local string="${1}"
shift
local element=''
for element in "$@"; do
if [[ "${string}" =~ "^${element}" ]]; then
return 0
fi
done
return 1

}
man() {
if command -v vimmanpager >/dev/null 2>&1; then
PAGER="vimmanpager" command man "$@"
else
command man "$@"
fi
}

# Le features!
# extended globbing, awesome!
setopt extendedGlob

# zmv - a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Control-x-e to open current line in $EDITOR, awesome when writting functions or editing multiline commands.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Include user-specified configs.
if [ ! -d "${ZSHDDIR}" ]; then
mkdir -p "${ZSHDDIR}" && echo "# Put your user-specified config here." > "${ZSHDDIR}/example.zsh"
fi

for zshd in $(ls -A ${HOME}/.config/zsh.d/^*.(z)sh$); do
. "${zshd}"
done

# Completion.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{001}%d%f%u' ## 001 = Red

# If running as root and nice >0, renice to 0.
if [ "$USER" = 'root' ] && [ "$(cut -d ' ' -f 19 /proc/$$/stat)" -gt 0 ]; then
renice -n 0 -p "$$" && echo "# Adjusted nice level for current shell to 0."
fi

# Ignore lines prefixed with '#'.
setopt interactivecomments

# Ignore duplicate in history.
setopt hist_ignore_dups

# Fixa delad historik
setopt sharehistory
setopt extendedhistory

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Nobody need flow control anymore. Troublesome feature.
#stty -ixon
setopt noflowcontrol

# Fix for tmux on linux.
case "$(uname -o)" in
'GNU/Linux')
export EVENT_NOEPOLL=1
;;
esac

# Aliases
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
alias e='emacs'

# Keys.
#case $TERM in
#rxvt*|xterm*)
#bindkey "^[[7~" beginning-of-line #Home key
#bindkey "^[[8~" end-of-line #End key
#bindkey "^[[3~" delete-char #Del key
#bindkey "^[[A" history-beginning-search-backward #Up Arrow
#bindkey "^[[B" history-beginning-search-forward #Down Arrow
#bindkey "^[Oc" forward-word # control + right arrow
#bindkey "^[Od" backward-word # control + left arrow
#bindkey "^H" backward-kill-word # control + backspace
#bindkey "^[[3^" kill-word # control + delete
#;;

#linux)
#bindkey "^[[1~" beginning-of-line #Home key
#bindkey "^[[4~" end-of-line #End key
#bindkey "^[[3~" delete-char #Del key
#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward
#;;

#screen|screen-*)
#bindkey "^[[1~" beginning-of-line #Home key
#bindkey "^[[4~" end-of-line #End key
#bindkey "^[[3~" delete-char #Del key
#bindkey "^[[A" history-beginning-search-backward #Up Arrow
#bindkey "^[[B" history-beginning-search-forward #Down Arrow
#bindkey "^[Oc" forward-word # control + right arrow
#bindkey "^[Od" backward-word # control + left arrow
#bindkey "^H" backward-kill-word # control + backspace
#bindkey "^[[3^" kill-word # control + delete
#;;
#esac

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

if [ -f ~/.alert ]; then echo '>>> Check ~/.alert'; fi



unset SSH_ASKPASS

