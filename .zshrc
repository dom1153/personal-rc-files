# ===
# === ZSH RC
# ===
# LAST RECORDED UPDATE: MAR 28 2023
# AUTHOR: DOMINIC DANG

# ===
# === SOURCE BASH RC
# ===
[[ -e ~/.bash_profile ]] && emulate sh -c 'source ~/.bash_profile'
### For convenience
### ~/.alias ~/.alias-perforce ~/.alias-local ~/.bash.pathsettings

# ===
# === PROMPT
# ===
export PS1="╭─ %F{green}%n@%m%f | %F{blue}%W | %t %f
│ %1~
╰─%# "

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  # === HACK: assume the default zsh_custom avoid sourcing zsh twice
  export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

  # === THEME 
  ZSH_THEME="bira"
  # Other themes:
  # robbyrussell  # A very fast, minimal theme
  # agnoster      # is fun but a slow theme
  # candy         # like bira, has time, but less interesting
  # bira          # two line prompt piped together
  # spaceship     # plugin/addon prompt with easy customization

  # === PLUGINS
  # plugins=(git)
  if [[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
   fish-like prompt
   plugins+=("zsh-autosuggestions")
  fi

  # === OH-MY-ZSH INCLUDE
  # setup oh-my-zsh
  export ZSH=$HOME/.oh-my-zsh
  source $ZSH/oh-my-zsh.sh
fi

# =========================== ALIASES OVERRIDE =========================
alias sx='source ~/.zshrc'
alias xx='vim ~/.zshrc'
