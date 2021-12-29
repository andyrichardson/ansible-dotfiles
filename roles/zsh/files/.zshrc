source $HOME/.antigen/antigen.zsh

# Environment
export EDITOR=nvim
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true 
export LESS='-R --use-color -Dd+r$Du+b'

# Color support
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

antigen use oh-my-zsh

# Plugins
antigen bundles <<EOF
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  chrissicool/zsh-256color
  lukechilds/zsh-nvm
  lukechilds/zsh-better-npm-completion
  MichaelAquilina/zsh-autoswitch-virtualenv
  romkatv/powerlevel10k
  npm
  git
  andyrichardson/zsh-node-path
EOF
antigen apply

# Load powerlevel
source ~/.antigen/bundles/romkatv/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

# Load completions
autoload -U compinit && compinit

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
