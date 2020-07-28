# ===
# === BASHRC 
# ===
# LAST RECORDED UPDATE: Circa 2/12/2020
# AUTHOR: DOMINIC DANG

# read bashrc if it exists
[[ -r ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'

# rbenv (ruby) setup https://github.com/rbenv/rbenv#basic-github-checkout
if [ -d "$HOME/.rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  if [ -d "$HOME/.rbenv/shims" ]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
  fi
  if [ -d "$HOME/gems" ]; then
    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH"
  fi
  source ~/.rbenv/completions/rbenv.bash
  rbenv rehash
  eval "$(rbenv init -)"
fi

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
shellos="UNKNOWN OS"
case `uname` in
  MSYS_NT-10.0)
    shellos="GIT BASH"
    ;;
  Darwin)
    ZSH_DISABLE_COMPFIX=true
    shellos="MAC"
    ;;
  Linux)
    shellos="LINUX"
    # set cursor speed (DELAY RATE)
    if [ -n "`command -v foo >/dev/null 2>&1`" ]; then
      xset r rate 150 30
    fi
    verpath="/proc/version"
    if [ -f $verpath ] && [ "`grep 'Microsoft' $verpath`" ]; then
      shellos="WSL"
      # requires xserver such as vcsxsrv (sourceforge)
      # see article: https://www.how2shout.com/how-to/run-linux-gui-apps-on-windows-10-with-native-bash.html
      export DISPLAY="localhost:0"
      export winhome="$(wslvar USERPROFILE)"
      if [ -f ~/.windows-alias ]; then
        source ~/.windows-alias
      fi
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
