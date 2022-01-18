#  ____   _____   ____
# |  _ \ |  __ \ |  _ \    Brendon Barrios -> github.com/BrendosaurusRex
# | |_) || |__) || |_) |
# |  _ < |  _  / |  _ <
# | |_) || | \ \ | |_) |
# |____(_)_|  \_(_)___(_)


# ,--------------------------------.
# | oooooooooooooooooooo J8     +====
# | 1ooooooooooooooooooo  PoE   | USB
# |  Wi                    1o   +====
# |  Fi  Pi Model 3B+ V1.3 oo      |
# |        ,----.               +====
# | |D|    |SoC |               | USB
# | |S|    |    |               +====
# | |I|    `----'                  |
# |                   |C|     +======
# |                   |S|     |   Net
# | pwr        |HDMI| |I||A|  +======
# `-|_|--------|____|----|V|-------'

#      __            __
#     / /  ___  ___ / /  ________
#  _ / _ \/ _ `(_-</ _ \/ __/ __/
# (_)_,__/\_,_/___/_//_/_/  \__/

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# ===============================================================================================
# User-added settings
# ===============================================================================================
# Set vim as default text editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Set Vi mode in bash
set -o vi
setxkbmap -option "ctrl:swapcaps"   # the must-have remap

# ===============================================================================================
export TERM=xterm-256color
# Place New Colors for prompt here!!
black=$(tput setaf 0); red=$(tput setaf 1); green=$(tput setaf 2); straw=$(tput setaf 3);
blue=$(tput setaf 27); white=$(tput setaf 255); purple=$(tput setaf 97); yellow=$(tput setaf 226);
gray=$(tput setaf 248); orange=$(tput setaf 166); pink=$(tput setaf 199); sky=$(tput setaf 75);
crimson=$(tput setaf 88); scarlet=$(tput setaf 124);

bold=$(tput bold); reset=$(tput sgr0);
# ===============================================================================================

# Green & Purple
PS1="\[${purple}\]\u";
PS1+="\[${gray}\] at \[${green}\]\h";
PS1+="\[${gray}\] in ";
PS1+="\[${reset}${straw}\]\w\n";
PS1+="\[${reset}${gray}\]-> ";
PS1+="\[${reset}\]";

export PS1;

# ===============================================================================================

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

# ===============================================================================================
# Place New Colors for prompt here!!
black=$(tput setaf 0); red=$(tput setaf 1); green=$(tput setaf 2); straw=$(tput setaf 3);
blue=$(tput setaf 27); white=$(tput setaf 255); purple=$(tput setaf 97); yellow=$(tput setaf 226);
gray=$(tput setaf 248); orange=$(tput setaf 166); pink=$(tput setaf 199); sky=$(tput setaf 75);
crimson=$(tput setaf 88); scarlet=$(tput setaf 124);

#black=$(tput setaf 0);  green=$(tput setaf 2); mustard=$(tput setaf 3);
#black=$(tput setaf 0); red=$(tput setaf 1); green=$(tput setaf 2); mustard=$(tput setaf 3);

bold=$(tput bold); reset=$(tput sgr0);
# ===============================================================================================

#if [ "$color_prompt" = yes ]; then
#    # Superman Theme
#    # PS1="\[${scarlet}\]\u";
#    # PS1+="\[${white}\] @ ";
#    # PS1+="\[${blue}\]\h";
#    # PS1+="\[${white}\]\[${bold}\]:";
#    # PS1+="\[${reset}${yellow}\]\w\n";
#    # PS1+="\[${reset}\]-> ";
#
#
#    # Green & Purple
#    PS1="\[${purple}\]Brendon";
#    PS1+="\[${gray}\] at \[${green}\]Work";
#    PS1+="\[${bold}${gray}\] in ";
#    PS1+="\[${reset}${straw}\]\w";
#    PS1+="\[${sky}\] $(__git_ps1 "(%s)")\n";
#    PS1+="\[${reset}${gray}\]-> ";
#    PS1+="\[${reset}\]";
#
#    export PS1;
#
## Original setting:
##  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
