# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export TERM=xterm-256color

#if [[ ! $TERM =~ screen ]]; then
#    exec tmux attach -t tmuxx
#fi

## Fix för git i prompten
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export PS1='Geoff[\W]$(__git_ps1 "(%s)"): '
fi

# ANSI color codes
RS='\[\033[0m\]'    # reset
HC='\[\033[1m\]'    # hicolor
UL='\[\033[4m\]'    # underline
INV='\[\033[7m\]'   # inverse background and foreground
FBLK='\[\033[30m\]' # foreground black
FRED='\[\033[31m\]' # foreground red
FGRN='\[\033[32m\]' # foreground green
FYEL='\[\033[33m\]' # foreground yellow
FBLE='\[\033[34m\]' # foreground blue
FMAG='\[\033[35m\]' # foreground magenta
FCYN='\[\033[36m\]' # foreground cyan
FWHT='\[\033[37m\]' # foreground white
BFBLK='\[\033[1;30m\]' # bold foreground black
BFRED='\[\033[1;31m\]' # bold foreground red
BFGRN='\[\033[1;32m\]' # bold foreground green
BFYEL='\[\033[1;33m\]' # bold foreground yellow
BFBLE='\[\033[1;34m\]' # bold foreground blue
BFMAG='\[\033[1;35m\]' # bold foreground magenta
BFCYN='\[\033[1;36m\]' # bold foreground cyan
BFWHT='\[\033[1;37m\]' # bold foreground white
BBLK='\[\033[40m\]' # background black
BRED='\[\033[41m\]' # background red
BGRN='\[\033[42m\]' # background green
BYEL='\[\033[43m\]' # background yellow
BBLE='\[\033[44m\]' # background blue
BMAG='\[\033[45m\]' # background magenta
BCYN='\[\033[46m\]' # background cyan
BWHT='\[\033[47m\]' # background white





# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

## Fixa pathen

PATH=/usr/bin:$HOME/Documents/Scripts:$HOME/.install/matlab/bin:$PATH
# Bash completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
export GIT_PS1_SHOWDIRTYSTATE=1
if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

################## The one that matters
#
	
	#export PS1=''$RS'[${debian_chroot:+($debian_chroot)}\u@\h \w ]$(__git_ps1 "(%s)") $ '
	export PS1=''$RS'[${debian_chroot:+($debian_chroot)}'$FBLE'\u'$BFBLK'@\h:'$RS''$FBLE'\w'$FYEL'$(__git_ps1 "(%s)")'$RS']'$FBLE'$ '$RS''
#
########################################
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	PS1="[${debian_chroot:+($debian_chroot)}\u: \w ]\\$ "

fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# GIT
function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

#PS1="\w  "


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


#aliases
alias e='TERM=xterm emacs -nw'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
