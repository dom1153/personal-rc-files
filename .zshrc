# =========================== OH MY ZSH RC ===================================
# LAST RECORDED UPDATE: JAN 20 2019
# AUTHOR: DOMINIC DANG
# =========================== OH MY ZSH RC END ===============================

# =========================== THEME ==========================================
ZSH_THEME="bira"
#
# Other themes:
# robbyrussell	# A very fast, minimal theme
# agnoster		  # is fun but a slow theme
# candy         # like bira, has time, but less interesting
# bira          # two line prompt piped together
# =========================== THEME END ======================================

# =========================== PLUGINS ========================================
#plugins=(git)
# =========================== PLUGINS END ====================================

# =========================== ENV VARIABLES ==================================
# leave this before other zsh settings
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH	
export EDITOR='vim'
export raspberry=pi@192.168.1.14

# turn off some dumb highlighting with folders with ls
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# avoid showing username
#DEFAULT_USER=`whoami`
# =========================== ENV VARIABLES END ==============================

# =========================== ALIASES ========================================
source ~/.alias
source ~/.perforcealias
alias sx='source ~/.zshrc'
alias xx='vim ~/.zshrc'
# =========================== ALIASES END ====================================

# =========================== TERM SETTINGS ==================================
# disable ctrl-s because thats for old terminals
stty -ixon	

# set cursor speed (DELAY RATE) [linux]
# xset r rate 150 30
# =========================== TERM SETTINGS END ==============================

