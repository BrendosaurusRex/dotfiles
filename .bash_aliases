#       __               __              __
#      / /_  ____  _____/ /_      ____  / (_)___  ________  _____
#     / __ \/ __ `/ ___/ __ \    / __ `/ / / __ `/ ___/ _ \/ ___/
#  _ / /_/ / /_/ (__  ) / / /   / /_/ / / / /_/ (__  )  __(__  )
# (_)_,___/\__,_/____/_/ /_/____\__,_/_/_/\__,_/____/\___/____/
#                         /_____/
# ---------------------------------------------------------------------------------------------------

alias update="sudo apt update && sudo apt dist-upgrade -y"
alias clean="sudo apt autoremove --purge && sudo apt autoclean"
alias v=vim
alias g=git
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ino=arduino-cli
alias ydl=youtube-dl
alias py=python3

alias la="ls -hlA"
alias ll='ls -alF'
alias l='ls -CF'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias print256colors="~/print256colors.sh"
alias p256="~/print256colors.sh"

# ----------------------------------------------------------------------------------------
# From default .bashrc:

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

