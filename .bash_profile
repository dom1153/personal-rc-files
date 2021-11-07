# ===
# === BASHRC 
# ===
# LAST RECORDED UPDATE: Circa 2/12/2020
# AUTHOR: DOMINIC DANG

function trysource() {
  if [ -n "$1" ]; then
    if [[ -r $1 ]]; then
      . $1
    else
      echo "Could not read file $1"
    fi
  else
      echo "Bad argument to trysource '$1'"
  fi
}

# read bashrc if it exists
[[ -r ~/.bashrc ]] && . ~/.bashrc

# ===
# === SOURCE FILES
# ===
trysource ~/.alias
trysource ~/.alias-perforce
trysource ~/.alias-local
trysource ~/.bash.pathsettings

# ===
# === TERM SETTINGS
# ===
# disable ctrl-s because thats for old terminals
stty -ixon

# ===
# === DEFAULT BASH SETTINGS
# === (default from linux/ubuntu rc files)
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

# ===
# === MY BASH SETTINGS
# ===
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
# to search last command with ! type space instead of tab
bind Space:magic-space
export EDITOR='vim'

# ===
# === OS SPECIFIC SETTINGS 
# ===
shellos="UNKNOWN OS"
case $(uname) in
  MSYS_NT-10.0)
    shellos="GIT BASH"
    ;;
  Darwin)
    ZSH_DISABLE_COMPFIX=true
    # https://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output
    # enable ls color
    export CLICOLOR=1
    # mimic typical linux ls color scheme
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
    shellos="MAC"
    ;;
  Linux)
    shellos="LINUX"
    # set cursor speed (DELAY RATE)
    if [ -n "$(command -v foo >/dev/null 2>&1)" ]; then
      xset r rate 150 30
    fi
    verpath="/proc/version"
    if [ -f $verpath ] && [ "$(grep -i 'Microsoft' $verpath)" ]; then
      shellos="WSL"
      # requires xserver such as vcsxsrv (sourceforge)
      # see article: https://www.how2shout.com/how-to/run-linux-gui-apps-on-windows-10-with-native-bash.html
      # updated (wsl 2 https://medium.com/javarevisited/using-wsl-2-with-x-server-linux-on-windows-a372263533c3)
      # export DISPLAY="DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0"
      if [ -z $DISPLAY ]; then
        export DISPLAY="localhost:0"
      fi
      # export DISPLAY="127.0.0.1:0.0"
      # ... current status, just let wsl set the status, dont set manually
      export winhome="$(wslvar USERPROFILE)"
      trysource ~/.alias-windows
    fi

    # turn off some dumb highlighting with folders with ls
    export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
    ;;
esac

# ===
# === PROMPT (BASH)
# ===
red="\[\033[31m\]"
green="\[\033[32m\]"
yellow="\[\033[33m\]"
blue="\[\033[34m\]"
magenta="\[\033[35m\]"
cyan="\[\033[36m\]"
white="\[\033[37m\]"
endcolor="\[\033[0m\]"
export PS1="${white}╭─${endcolor}${green} \u@\h${endcolor} | ${cyan}\d${endcolor} | ${cyan}\@${endcolor} | ${cyan}$shellos${endcolor}\n│ ${yello}\w${endcolor}\n╰─$ "
