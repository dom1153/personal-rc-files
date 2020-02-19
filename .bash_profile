# ===
# === BASHRC 
# ===
# LAST RECORDED UPDATE: Circa 2/12/2020
# AUTHOR: DOMINIC DANG

# read bashrc if it exists
# [[ -r ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'

# ===
# === SOURCE FILES
# ===
if [ -f ~/.alias ]; then
  source ~/.alias
fi

if [ -f ~/.perforcealias ]; then
  source ~/.perforcealias
fi

# ===
# === ALIASES
# ===
alias sx="source ~/.bash_profile"
alias xx='vim ~/.bash_profile'

# ===
# === BASH SETTINGS
# ===
red="\[\033[31m\]"
green="\[\033[32m\]"
yellow="\[\033[33m\]"
blue="\[\033[34m\]"
magenta="\[\033[35m\]"
cyan="\[\033[36m\]"
white="\[\033[37m\]"
endcolor="\[\033[0m\]"
export PS1="${white}╭─${endcolor}${green} \u@\h${endcolor} | ${magenta}\d${endcolor} | ${magenta}\@${endcolor}\n│ ${yello}\w${endcolor}\n╰─$ "

# ===
# === TERM SETTINGS
# ===
# disable ctrl-s because thats for old terminals
stty -ixon

# ===
# === Default bash settings
# === Things that come with linux/ubuntu rc files
# append to history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi
unset color_prompt force_color_prompt
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# ===
# === OS SPECIFIC SETTINGS 
# ===
case `uname` in
  MSYS_NT-10.0)
  ;;
  Darwin)
    ZSH_DISABLE_COMPFIX=true
  ;;
  Linux)
    # set cursor speed (DELAY RATE)
    if [ -n "`command -v foo >/dev/null 2>&1`" ]; then
      xset r rate 150 30
    fi
 
    # turn off some dumb highlighting with folders with ls
    export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
  ;;
esac
