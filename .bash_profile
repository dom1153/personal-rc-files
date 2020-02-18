# =========================== OH MY ZSH RC ==============================
# LAST RECORDED UPDATE: JAN 2/12/2020
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
export PS1="${white}╭─${endcolor}${green} \u@\h${endcolor} | ${cyan}\d${endcolor} | ${cyan}\@${endcolor}\n│ ${yello}\w${endcolor}\n╰─$ "

# ===
# === TERM SETTINGS
# ===
# disable ctrl-s because thats for old terminals
stty -ixon

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
