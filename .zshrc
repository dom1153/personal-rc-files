# =========================== OH MY ZSH RC ==============================
# LAST RECORDED UPDATE: JAN 20 2019
# AUTHOR: DOMINIC DANG

# =======================================================================
# HACK: assume the default zsh_custom avoid sourcing zsh twice
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# =========================== THEME =====================================
ZSH_THEME="bira"
# Other themes:
# robbyrussell  # A very fast, minimal theme
# agnoster      # is fun but a slow theme
# candy         # like bira, has time, but less interesting
# bira          # two line prompt piped together
# spaceship     # plugin/addon prompt with easy customization

# =========================== PLUGINS ==================================
#plugins=(git)
if [[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
  # fish-like prompt
  plugins+=("zsh-autosuggestions")
fi

# =========================== OH-MY-ZSH INCLUDE ========================
# leave this before other zsh settings, but set oh-my-zsh settings before it
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  export ZSH=$HOME/.oh-my-zsh
  source $ZSH/oh-my-zsh.sh
fi

# =========================== ENV VARIABLES ============================
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'

# =========================== ALIASES ==================================
source ~/.alias
source ~/.perforcealias
alias sx='source ~/.zshrc'
alias xx='vim ~/.zshrc'

# =========================== TERM SETTINGS ============================
# disable ctrl-s because thats for old terminals
stty -ixon

# =========================== OS SPECIFIC SETTINGS =====================
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
